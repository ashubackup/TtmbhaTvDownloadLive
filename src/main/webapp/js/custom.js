$('.artistslider').slick({
    arrows: true,
    dots: false,
    infinite: false,
    centerPadding: '60px',
    slidesToShow: 6,
    slidesToScroll: 1,
    responsive: [
        {
            breakpoint: 1800,
            settings: {
                arrows: true,
                centerPadding: '40px',
                slidesToShow: 5
            }
        },
        {
            breakpoint: 1600,
            settings: {
                arrows: true,
                centerPadding: '40px',
                slidesToShow: 4
            }
        },
        {
        breakpoint: 768,
        settings: {
            arrows: true,
            centerPadding: '40px',
            slidesToShow: 3
        }
        },
        {
        breakpoint: 560,
        settings: {
            arrows: false,
            centerPadding: '40px',
            slidesToShow: 2
        }
        },
        {
            breakpoint: 360,
            settings: {
                arrows: false,
                centerPadding: '40px',
                slidesToShow: 1
            }
        }
    ]
});

$('.randomvideo').slick({
    arrows: true,
    dots: false,
    centerPadding: '60px',
    slidesToShow: 8,
    infinite: false,
    slidesToScroll: 1,
    responsive: [
        {
            breakpoint: 1800,
            settings: {
                slidesToShow: 7
            }
        },
        {
            breakpoint: 1600,
            settings: {
                slidesToShow: 6
            }
        },
        {
            breakpoint: 1300,
            settings: {
                slidesToShow: 5
            }
        },
        {
            breakpoint: 950,
            settings: {
                slidesToShow: 4
            }
        },
        {
            breakpoint: 768,
            settings: {
                centerPadding: '40px',
                slidesToShow: 3
            }
        },
        {
            breakpoint: 500,
            settings: {
                arrows: false,
                centerPadding: '40px',
                slidesToShow: 2
            }
        }
    ]
});


$('.dropdown-menu a.dropdown-toggle').on('click', function(e) {
  if (!$(this).next().hasClass('show')) {
    $(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
  }
  var $subMenu = $(this).next(".dropdown-menu");
  $subMenu.toggleClass('show');


  $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
    $('.dropdown-submenu .show').removeClass("show");
  });


  return false;
});