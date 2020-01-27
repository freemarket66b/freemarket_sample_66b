$(function(){
    $("img.photo__sub").click(function(){
        var ImgSrc = $(this).attr("src");
        $("img.photo__top").attr({src:ImgSrc});
        $("img.photo__top").hide();
        $("img.photo__top").fadeIn("slow");
        return false;
    });
  });