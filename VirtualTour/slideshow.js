if (typeof console == 'undefined')
{
	console = {log: function(){}};
}

YAHOO.namespace('widget.SlideShow');

(function () {

	YAHOO.widget.SlideShow = function(el, userConfig)
	{
		YAHOO.widget.SlideShow.superclass.constructor.call(this, el, userConfig);
	};

    var Dom = YAHOO.util.Dom,
        SlideShow = YAHOO.widget.SlideShow,

        /**
        * Constant representing the name of the Dialog's events
        * @property EVENT_TYPES
        * @private
        * @final
        * @type Object
        */
        EVENT_TYPES = {
            "TRANSITION_PRELOAD":  "transitionPreload",
            "TRANSITION_START":    "transitionStart",
            "TRANSITION_COMPLETE": "transitionComplete",
            "SLIDESHOW_START": "slideShowStart",
            "SLIDESHOW_STOP": "slideShowStop"
        },
        
        Slide = function()
        {

        };
    
    // private class for holding information about slides    
	Slide.prototype =
	{
		imageSrc: 	null,
		image: 		null,
		elem: 		null,
		loaded: 	false,
		elemFooter: null,
		delay:		null
	};

	YAHOO.extend(SlideShow, YAHOO.widget.Module, {
	
		/* variables */
		currentNdx: 		-1,
		transitionToNdx: 	-1,
		queuedtransitionToNdx: -1,
		numImagesLoading: 		0,
		numImagesToLoad:		0,
		slides: 			[],
		_isPlaying:				false,
		transitionTimer:		null,
		_htmlTemplate: null,

		init : function(el, userConfig) 
		{
			SlideShow.superclass.init.call(this, el, userConfig);
			var slideTemplateElem = this.getFirstElementByClassName('slide', 'div', this.element);
			this._htmlTemplate = slideTemplateElem.innerHTML;
			this.element.removeChild(slideTemplateElem);
		},
		
		initEvents : function()	{
			SlideShow.superclass.initEvents.call(this); 
			
			this.transitionPreloadEvent = this.createEvent(EVENT_TYPES.TRANSITION_PRELOAD);
		
			this.transitionStartEvent = this.createEvent(EVENT_TYPES.TRANSITION_START);
		
			/**
			 * Fires when a transitioning into a new slide is complete
			 *
			 * @event transitionComplete
			 * @param event.ndx {String} The index of the slide that is now visible.
			 */	
			this.transitionCompleteEvent = this.createEvent(EVENT_TYPES.TRANSITION_COMPLETE);

			this.slideShowStartEvent = this.createEvent(EVENT_TYPES.SLIDESHOW_START);

			this.slideShowStopEvent = this.createEvent(EVENT_TYPES.SLIDESHOW_STOP);
		},
	        
		initDefaultConfig : function () 
		{
			SlideShow.superclass.initDefaultConfig.call(this); 
		
			/**
		     * Fade in/fade out duration in seconds
		     * @config 
		     * @type Number
		     * @default 1
		    */ 
		    this.cfg.addProperty('fade_duration_secs', { value: 1 });
		
			/**
		     * Transition delay in seconds
		     * @config 
		     * @type Number
		     * @default 5
		    */ 
		    this.cfg.addProperty('transition_delay_secs', { value: 2 });
		},
		
		getCurrentSlide: function()
		{
			return this.currentNdx;
		},
		
		getNumSlides: function()
		{
			return this.slides.length;
		},
		
		isPlaying: function()
		{
			return this._isPlaying;
		},
		
		play: function()
		{
			if (!this._isPlaying)
			{
				this.slideShowStartEvent.fire();
				this._isPlaying = true;
				this._advance(true);
			}
		},
		
		stop: function()
		{
			if (this._isPlaying)
			{
				this._isPlaying = false;
				this.slideShowStopEvent.fire();
			}
		},
		
		goTo: function(ndx)
		{
			this.stop();
			this._startTransition(ndx);
		},
		
		goNext: function(allowWrap)
		{
			this.stop();
			this._advance(allowWrap);
		},
		
		goPrev: function(allowWrap)
		{
			this.stop();
			if (this.transitionToNdx >= 0) { return false; }
			
			transitionToNdx = this.currentNdx - 1;
			if (transitionToNdx < 0)
			{
				if (allowWrap)
				{
					transitionToNdx = this.slides.length - 1;
				}
				else
				{
					return false;
				}
			}
	   		this._startTransition(transitionToNdx) ;
	   		return true;
		},
		
		_advance: function(allowWrap)
		{
			var transitionToNdx = this.currentNdx + 1;
			if (transitionToNdx >= this.slides.length)
			{
				if (allowWrap)
				{
					transitionToNdx = 0;
				}
				else
				{
					return false;
				}
			}
	   		this._startTransition(transitionToNdx);
	   		return true;
		},
		
		_playNext: function()
		{
			this._clearTransitionTimer();
			if (this.queuedtransitionToNdx >= 0)
			{
				var ndx = this.queuedtransitionToNdx;
				this.queuedtransitionToNdx = -1;
		   		this._startTransition(ndx) ;
			}
			else
			{
				if (this.isPlaying()) { this._advance(true); }
			}
		},
	
		addSlide: function(imageSrc, options)
		{
			var header = options.header || '',
				footer = options.footer || '',
				slide = new Slide(),
				elem,
				elemFooter,
				elemHeader,
				image,
				_this,
				ndx;
				
			if (typeof header != 'string') { header = ''; }
			if (typeof footer != 'string') { footer = ''; }
			
			elem = document.createElement('div');
			elem.className = 'slide';
			elem.innerHTML = this._htmlTemplate;
			Dom.setStyle(elem, 'opacity', 0);
			Dom.setStyle(elem, 'display', 'none');
			elem.style.width = this.element.clientWidth + 'px';
			elem.style.visibility = 'visible';
			
			elemFooter = this.getFirstElementByClassName('ft', 'div', elem);
			elemHeader = this.getFirstElementByClassName('hd', 'div', elem);
			
			if (elemHeader) { elemHeader.innerHTML = header; }
			if (elemFooter) { elemFooter.innerHTML = "<div class='ft-inner'>" + footer + "</div>"; }
			
			image = new Image();
			_this = this;
			ndx = this.slides.length;
			image.onload = function() {
				var s = elem.style;
				s.backgroundImage = "url('" + imageSrc + "')";
				_this._onImageLoaded(ndx);
			};
			
			this.element.appendChild(elem);
			
			// note that image.src isn't set because we don't want the image to 
			// load just yet

			slide.elem = elem;
			slide.image = image;			
			slide.imageSrc = imageSrc;
			slide.delay = options.delay || null;
			
			if (elemFooter  &&  elemFooter.style.visibility == 'hidden'  &&  footer)
			{			
				slide.elemFooter = elemFooter;
			}
			
			this.slides.push(slide);
	
			++this.numImagesToLoad;
			this._queuePreloadImages();
		},
	
		_queuePreloadImages : function() {
			var _this = this;
			setTimeout(function() { _this._preloadImage(); }, 100);
		},
		
		_preloadImage: function(ndx)
		{
			var i, slide;
		
			if (this.numImagesToLoad === 0) { return; }
			
			ndx = ndx || -1;
			
			if (ndx >= 0)
			{
				// a specific image was specified, make sure it's not already
				// loaded
				if (this.slides[ndx].loaded) { return; }
			}
			else
			{
				ndx = -1;
	
				// quit if we're already busy loading an image
				if (this.numImagesLoading > 0) { return; }
				
				// find the next image in order to preload (startign with the
				// next slide that will show)
				for (i = this.currentNdx + 1; i != this.currentNdx; ++i)
				{
					if (i == this.slides.length) { i = 0; }
					
					if (!this.slides[i].loaded)
					{
						ndx = i;
						break;
					}
				}

				if (ndx < 0) { return; }  // fail-safe
			}

			slide = this.slides[ndx];
			slide.image.src = slide.imageSrc;  // start the preload
			++this.numImagesLoading;
		},
		
		_onImageLoaded: function(slideIndex)
		{
			--this.numImagesLoading;
			--this.numImagesToLoad;
			this.slides[slideIndex].loaded = true;
			if (slideIndex == this.transitionToNdx)
			{
				this._startTransition();
			}
			this._queuePreloadImages();  // load next image
		},
		
		_clearTransitionTimer: function()
		{
			if (this.transitionTimer)
			{
				clearTimeout(this.transitionTimer);
				this.transitionTimer = null;
			}
		},
		
		_startTransition: function(ndx)
		{
			if (typeof ndx != 'undefined')
			{			
				if (ndx == this.currentNdx) { return; }
				
				if (this.transitionToNdx >= 0)
				{
					if (this.transitionToNdx != ndx) 
					{
						this._clearTransitionTimer();
						this.queuedtransitionToNdx = ndx;
					}
					return;
				}
				
				this.transitionToNdx = ndx;
			}

			this._clearTransitionTimer();

			/**
			 * If the image for the slide we're transitioning to hasn't been 
			 * fully loaded yet, quit here.  onImageLoaded() will call back 
			 * when the image is ready.
			 */
			if (!this.slides[this.transitionToNdx].loaded)
			{
				this.transitionPreloadEvent.fire(this.transitionToNdx);
				this._preloadImage(this.transitionToNdx);
				return;
			}

			this.transitionStartEvent.fire({'newIndex': this.transitionToNdx, oldIndex: this.currentNdx});
			
			var anim,
				fade_duration = this.cfg.getProperty('fade_duration_secs'),
				_this = this;
			
			if (this.currentNdx >= 0  &&  0)
			{
				// fade out
//	console.log('fade out ' + 		this.currentNdx);
				anim = new YAHOO.util.Anim(
					newElem, 
					{ opacity: {from: 1.0, to: 0 } }, 
					fade_duration, 
					YAHOO.util.Easing.easeOut);
			    anim.onComplete.subscribe(function() {
			    	_this._completeTransition();
			    });
				anim.animate();
			}
			else
			{
				this._completeTransition();
			}
		},
		
		_completeTransition: function()
		{
			var anim,
				fade_duration = this.cfg.getProperty('fade_duration_secs'),
				newElem,
				_this = this,
				prevElem = null;
				
			if (this.currentNdx >= 0)
			{
				prevElem = this.slides[this.currentNdx].elem;
				prevElem.style.zIndex = 1;
			}
			
			newElem = this.slides[this.transitionToNdx].elem;
			newElem.style.zIndex = 5;
			newElem.style.display = 'block';
		
			// fade in new slide
//console.log('fade in ' + 		this.transitionToNdx);
			anim = new YAHOO.util.Anim(
				newElem, 
				{ opacity: {from: 0, to: 0.99 } }, 
				fade_duration, 
				YAHOO.util.Easing.easeOut);
	    	anim.onComplete.subscribe(function() { 
	    		_this._postCompleteTransition(); 
	    	});
			anim.animate();
		},
		
		_postCompleteTransition: function()
		{
			var newSlide = this.slides[this.transitionToNdx],
				newElem = this.slides[this.transitionToNdx].elem,
				_this = this,
				timeout,
				prevSlide,
				prevElem;
				
			if (newElem.style.filter)
			{
	    		newElem.style.filter = '';  // IE
			}
			else
			{
				newElem.style.opacity = '';
//	    		Dom.setStyle(newElem, 'opacity', '');
	    	}

			if (this.currentNdx >= 0)
			{
				prevSlide = this.slides[this.currentNdx];
				prevElem = prevSlide.elem;
    			Dom.setStyle(prevElem, 'opacity', 0);
    			Dom.setStyle(prevElem, 'display', 'none');
    			if (prevSlide.elemFooter)
    			{
					this.slides[this.currentNdx].elemFooter.style.visibility = 'visible';
				}
			}

			if (newSlide.elemFooter)
			{
				newSlide.elemFooter.style.visibility = 'visible';
			}

			this.currentNdx = this.transitionToNdx;	
			this.transitionToNdx = -1;

			this.transitionCompleteEvent.fire(this.currentNdx);
			timeout = this.queuedtransitionToNdx >= 0? 
		    		0 : /* no wait if there is a queued slide */ 
		    		newSlide.delay;
			if (timeout === null)
			{
		    	timeout = this.cfg.getProperty('transition_delay_secs') * 1000;
		    }

		    this.transitionTimer = setTimeout(
		    	function() {
		    		_this._playNext();
				},
				timeout);
		},
		
		getFirstElementByClassName: function(className, tag, root, apply)
		{
			var res = Dom.getElementsByClassName(className, tag, root, apply);
			return res.length? res[0] : null;
		}
	});	

	YAHOO.lang.augmentProto(SlideShow, YAHOO.util.EventProvider);

	YAHOO.register("slideshow", YAHOO.widget.SlideShow, {version: "0.9", build: "100"});
}());



function setInnerText(elem, text)
{
	if (typeof elem == 'string') { elem = document.getElementById(elem); }
	if (elem.innerText)
	{
		// IE
		if (text === '') { text = ' '; }
		elem.innerText = text;
	}
	else
	{
		elem.textContent = text;
	}
}