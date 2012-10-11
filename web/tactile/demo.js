var demo = {
    ajax: new tactile.ContentLoader(),
    
    init: function() {   
    },
    
    bookLoaded: function() {
       var bookView = tactile.page.getComponent('lightbox');
       var content = demo.ajax.getResponseText();
       bookView.elem.innerHTML = content;
       tactile.page.getComponent('lightbox').toggle();
    },
    
    toggleLightBox: function(bookid) {
       tactile.page.getComponent('maskinglayer').toggle();
       
       if (tactile.page.getComponent('lightbox').isVisible()) {
           tactile.page.getComponent('lightbox').toggle();
       } else {
           demo.ajax = new tactile.ContentLoader();
           demo.ajax.load({ url: "/160697/mvcdemo/details.do?id=" + bookid});
           demo.ajax.onsuccess.subscribe(demo.bookLoaded);
       }
    }
}

tactile.page.onready(demo.init);

