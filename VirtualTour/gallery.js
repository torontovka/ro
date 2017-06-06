/* Copyright (c) 2008, Experion Inc.  All rights reserved. */

// FadeManager
(function() {

    var Dom = YAHOO.util.Dom;

    FadeManager = function(el, minOpacity, maxOpacity, fadeDuration) {
        this.el = Dom.get(el);
        this.minOpacity = minOpacity || 0;
        this.maxOpacity = maxOpacity || 1;
        this.fadeDuration = fadeDuration || 0.5;
    };

    FadeManager.prototype = {
    
        anim: null,
        fadingTo: -1,
        delayTimer: null,
    
        fadeIn: function(skipAnimation, delay) 
        {
            this.doAnimation(this.maxOpacity, skipAnimation, delay);
        },
        
        fadeOut: function(skipAnimation, delay) 
        {
            this.doAnimation(this.minOpacity, skipAnimation, delay);
        },
        
        fadeInOut: function(delay)
        {
        	this.fadeIn();
            var _this = this;
            this.anim.onComplete.subscribe(function() {
                _this.fadeOut(false, delay);
            });
        },
        
        showAndFadeOut: function(delay)
        {
            this.fadeIn(true);
            this.fadeOut(false, delay);
        },
        
        stop: function()
        {
            if (this.anim) { this.anim.stop(); }
        },
        
        doAnimation: function(toOpacity, skipAnimation, delay) 
        {
            if (this.delayTimer)
            {
            	clearTimeout(this.delayTimer);
                this.delayTimer = null;
            }
            if (delay)
            {
                var _this = this;
            	this.delayTimer = setTimeout(
                    function() { _this.doAnimation(toOpacity, skipAnimation); },
                    delay);
                return;
            }
            
            if (this.fadingTo == toOpacity) { return; }
            
            this.stop();
            
            this.fadingTo = toOpacity;
            var fromOpacity = Dom.getStyle(this.el, 'opacity');
            
            if (fromOpacity == toOpacity) { return; }
            
            if (skipAnimation)
            {
                Dom.setStyle(this.el, 'opacity', toOpacity);
                return;
            }
            
            this.anim = new YAHOO.util.Anim(
                this.el,
                { opacity: {from: Math.round(fromOpacity * 10) / 10.0, to: toOpacity } },
                this.fadeDuration,
                YAHOO.util.Easing.easeIn);
            this.anim.animate();
        }
    };
    
}());

// PreviewPopup
(function() {

    var Dom = YAHOO.util.Dom;

    PreviewPopup = function(ndx, anchor) {
		this.ndx = ndx;
		this.anchor = anchor;
		YAHOO.util.Event.addListener(this.anchor, 'mouseover', this.popup, this, true);
		YAHOO.util.Event.addListener(this.anchor, 'mouseout', this.hide, this, true);
	};
	
	PreviewPopup.currentlyShowing = null;
	PreviewPopup.throbber = document.createElement('img');
	
	PreviewPopup.prototype = {
		elem : null,
		popupTimer : null,
		disabled: false,
	
		popup: function()
		{
			if (PreviewPopup.currentlyShowing  &&  PreviewPopup.currentlyShowing != this)
			{
				PreviewPopup.currentlyShowing.hide();
			}
			PreviewPopup.currentlyShowing = this;

			var elem = this.elem, anchor = this.anchor, _this = this;
			
			if (elem === null)
			{
				this.elem = document.createElement('div');
				elem = this.elem;
				elem.className = 'preview-popup';
				elem.style.top = '-1000px';
				var div = document.createElement('div'),
					div2 = document.createElement('div'),
					img = document.createElement('img'),
					imgData = g_thumbImageList[this.ndx]; 
				div.className = 'preview-popup-inner';
				img.src = imgData.src;
				img.style.width = imgData.width;
				img.style.height = imgData.height;
				img.alt = '';
				img.style.visibility = 'hidden';
				YAHOO.util.Event.addListener(img, 'load', function() { img.style.visibility = 'visible'; } );
				div2.appendChild(PreviewPopup.throbber);
				div2.appendChild(img);
				div.appendChild(div2);
				elem.appendChild(div);
				document.body.appendChild(elem);
				div2.style.width = (imgData.width + 2) + 'px';
				div2.style.height = (imgData.height + 2) + 'px';
				PreviewPopup.throbber.style.left = Math.floor((div2.offsetWidth - PreviewPopup.throbber.width) / 2) + 'px';
				PreviewPopup.throbber.style.top  = Math.floor((div2.offsetHeight - PreviewPopup.throbber.height) / 2) + 'px';

				div = document.createElement('div');
				div.className = 'preview-popup-arrow';
				div.style.width = elem.offsetWidth;  // required for IE
				elem.appendChild(div);
				
				this.fader = new FadeManager(elem, 0, 1, 0.25);
				this.fader.fadeOut(true);
			}
			
			if (this.popupTimer)
			{
				clearTimeout(this.popupTimer);
			}
			
			if (this.disabled) { return; }
			
			this.popupTimer = setTimeout(
				function()
				{			
					var pos = YAHOO.util.Dom.getXY(anchor);
					elem.style.left = (pos[0] + Math.floor(anchor.offsetWidth / 2) - Math.floor(elem.offsetWidth / 2)) + 'px';
					elem.style.top = (pos[1] - elem.offsetHeight) + 'px';
					_this.fader.fadeIn();
				},
				200);
		},
		
		hide: function()
		{
			if (!this.elem) { return; }
			if (PreviewPopup.currentlyShowing == this)
			{
				PreviewPopup.currentlyShowing = null;
			}
			if (this.popupTimer)
			{
				clearTimeout(this.popupTimer);
			}
			this.fader.fadeOut();
		},
		
		disable: function()
		{
			this.hide();
			this.disabled = true;
		},

		enable: function()
		{
			this.disabled = false;
		}
	};
	
	var throbber = PreviewPopup.throbber;
	throbber.src = './throbber.gif';
	throbber.alt = '';
	throbber.id = 'preview-throbber';
}());




function SlideShowHandler(slideShow, carousel)
{
	this.slideShow = slideShow;
    this.carousel = carousel;
    
    this.infoElemFadeOutDelay = 1250;
    this.playInfoElem = document.getElementById('info-play');
    this.playInfoElem.fader = new FadeManager(this.playInfoElem, 0, 0.8, 0.5);
    this.playInfoElem.fader.fadeOut(true);
    this.playInfoElem.style.display = 'block';
    this.pauseInfoElem = document.getElementById('info-pause');
    this.pauseInfoElem.fader = new FadeManager(this.pauseInfoElem, 0, 0.8, 0.5);
    this.pauseInfoElem.fader.fadeOut(true);
    this.pauseInfoElem.style.display = 'block';
    
    this.slideShow.transitionPreloadEvent.subscribe(this.onTransitionPreload, this, true);
    this.slideShow.transitionStartEvent.subscribe(this.onTransitionStart, this, true);
    this.slideShow.transitionCompleteEvent.subscribe(this.onTransitionComplete, this, true);
    this.slideShow.slideShowStartEvent.subscribe(this.onShowStart, this, true);
    this.slideShow.slideShowStopEvent.subscribe(this.onShowStop, this, true);

    this.elemThrobber = document.getElementById('throbber');
}

SlideShowHandler.prototype = {

    onTransitionPreload: function(ndx)
    {
        this.elemThrobber.style.display = 'block';
    },

    onTransitionStart: function(indexes)
    {
        var desc, slide = this.slideShow.slides[indexes.newIndex];
        if (slide.description === undefined)
        {
       		slide.description = YAHOO.util.Dom.getElementsByClassName('description', '*', slide.elem)[0];
       		if (slide.description)
       		{
	        	desc = g_thumbImageList[indexes.newIndex].desc;
    	    	if (desc)
        		{
		    		slide.description.style.display = 'block';
		    		slide.descriptionFg = YAHOO.util.Dom.getElementsByClassName('description-fg', '*', slide.description)[0];
	        		slide.descriptionFg.innerHTML = desc;
    	    		slide.description.style.width = slide.image.width + 'px';
	    	    }
    		    else
    		    {
		    		slide.description.style.display = 'none';
    		    	slide.description = null;
    	    	}
    	    }
        }
        
        if (slide.description  &&  YAHOO.env.ua.ie)
        {
    		slide.descriptionFg.style.display = 'none';
        }
        
        if (indexes.oldIndex >= 0  &&0)
        {
        	slide = this.slideShow.slides[indexes.oldIndex];
	        if (slide.description)
	        {
	        	slide.descriptionFg.style.display = 'none';
	        }
        }

        this.elemThrobber.style.display = 'none';
        this.updateSlideShowControls(indexes.newIndex);
        
        // sync carousel
        this.selectCarouselItem(indexes.newIndex, indexes.oldIndex);
    },
    
    onTransitionComplete: function(ndx)
    {
        var slide = this.slideShow.slides[ndx];
    	if (slide.description)
    	{
    		slide.descriptionFg.style.display = '';
    	}
    },
    
    onShowStart: function()
    {
        document.getElementById('ssc-play').style.display = 'none';
        document.getElementById('ssc-pause').style.display = 'block';
    },

    onShowStop: function()
    {
        document.getElementById('ssc-play').style.display = 'block';
        document.getElementById('ssc-pause').style.display = 'none';

        this.playInfoElem.fader.fadeOut(true);
        this.pauseInfoElem.fader.showAndFadeOut(this.infoElemFadeOutDelay);
    },

    goTo: function(ndx)
    {
        this.slideShow.goTo(ndx);
    },

    goNext: function()
    {
        this.slideShow.goNext(false);
    },

    goPrev: function()
    {
        this.slideShow.goPrev(false);
    },

    goFirst: function()
    {
        this.goTo(0);
    },

    goLast: function()
    {
        this.goTo(this.slideShow.getNumSlides() - 1);
    },

    play: function()
    {
        this.pauseInfoElem.fader.fadeOut(true);
        this.playInfoElem.fader.showAndFadeOut(this.infoElemFadeOutDelay);
        var _this = this;
        setTimeout(
            function()
            {
                _this.slideShow.play();
            },
            500);
    },

    pause: function()
    {
        this.slideShow.stop();
    },

    updateSlideShowControls: function(ndx)
    {
        if (typeof ndx == 'undefined') { ndx = this.slideShow.getCurrentSlide(); }
        var last = this.slideShow.getNumSlides() - 1;

        // enable/disable slideshow controls
        this.enableSSC('ssc-first', ndx > 0);
        this.enableSSC('ssc-prev',  ndx > 0);
        this.enableSSC('ssc-next',  ndx < last);
        this.enableSSC('ssc-last',  ndx < last);
    },
    
    enableSSC: function(elemId, enable)
    {
        var elem = document.getElementById(elemId);
        if (enable)
        {
            YAHOO.util.Dom.removeClass(elemId, 'disabled');
        }
        else
        {
            YAHOO.util.Dom.addClass(elemId, 'disabled');
        }
    },

    selectCarouselItem: function(newNdx, oldNdx)
    {
        // carousel uses 1-based indexes
        ++oldNdx;  ++newNdx;

		var item;
        if (oldNdx > 0)
        {
        	item = this.carousel.getItem(oldNdx);
            YAHOO.util.Dom.removeClass(item, 'selected');
            item.preview.enable();
        }

        // scroll carousel if needed
        var firstVisible = this.carousel.getProperty("firstVisible");
        var lastVisible = firstVisible + this.carousel.getProperty("numVisible") - 1;
        var midPoint = (lastVisible - firstVisible + 1) / 2;
        var third = (lastVisible - firstVisible + 1) / 3;

        if (newNdx >= firstVisible + 2 * third)
        {
            this.carousel.scrollTo(Math.max(1, Math.round(newNdx - midPoint)));
        }
        if (newNdx < firstVisible + third)
        {
            this.carousel.scrollTo(Math.max(1, Math.round(newNdx - midPoint)));
        }

		item = this.carousel.getItem(newNdx);
        YAHOO.util.Dom.addClass(item, 'selected');
		item.preview.disable();
    }
};

function load(carousel, start, last) 
{
    for (var i = 1 * start; i <= last; ++i) 
    {
    	var item = carousel.getItem(i);
    	if (item  &&  item.preview)  // already loaded?
    	{
    		continue;
    	}
        item = carousel.addItem(i, 
            '<div class="carousel-item"><a href="javascript:g_slideShowHandler.goTo({i-1})">{i}</a></div>'.replace(/\{i\}/g, i).replace(/\{i-1\}/g, i - 1));
		item.preview = new PreviewPopup(i - 1, item.getElementsByTagName('a')[0]);
    }
}

function loadItems(type, args) {
    var start = args[0];
    var last = args[1]; 
    load(this, start, last);
}

var pageLoad = function() 
{
    var carousel = new YAHOO.extension.Carousel("carousel", 
        {
            numVisible:         21,
            animationSpeed:     0.5,
            animationMethod:    YAHOO.util.Easing.backIn,
            scrollInc:          5,
            navMargin:          0,
            size:               g_thumbImageList.length,
            loadInitHandler:    loadItems,
            loadNextHandler:    loadItems,
            loadPrevHandler:    loadItems
        }
    );
    
    var slideShow = new YAHOO.widget.SlideShow('photo', {
        fade_duration_secs: 0.7,
        transition_delay_secs: 2.5
    });
    g_slideShowHandler = new SlideShowHandler(slideShow, carousel);
    
    carousel.show();

    for (var i = 0; i < g_fullImageList.length; ++i)
    {
        var image = g_fullImageList[i];
        var desc = g_thumbImageList[i].desc;
        if (desc) 
        {
        	desc += '<span style="padding:0 10px">&middot;</span>';
		}
        desc += (i + 1) + '/' + g_fullImageList.length;
        slideShow.addSlide(image.src, { footer: desc });
        if (i === 0) { 
            g_slideShowHandler.goTo(0);
            carousel.carouselElem.style.visibility = 'visible';
        }
    }
    
    slideShow.play();
};

YAHOO.util.Event.addListener(window, 'load', pageLoad);