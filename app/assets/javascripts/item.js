$(function(){
    $(document).on('click', 'img.photo__sub', function(){
        var ImgSrc = $(this).attr("src");
        var ImgAlt = $(this).attr("alt");
        $("img.photo__top").attr({src:ImgSrc, alt:ImgAlt});
        $("img.photo__top").hide();
        $("img.photo__top").fadeIn("slow");
        return false;
    });
  });