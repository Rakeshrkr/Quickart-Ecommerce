<div class="container" id="gallary">
<div id="myCarousel" class="carousel slide" data-ride="carousel"><!--Carousel starts from here-->
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="<c:url value="/images/Men.jpg"></c:url>" alt="Men's Clothing">
       <div class="carousel-caption">
        <h3>Men's Wearing</h3>
        <p>A well-tied tie is the first serious step in life.</p>
      </div>
    </div>

    <div class="item">
      <img src="<c:url value="/images/Girl.jpg"></c:url>" alt="Girls Clothing">
       <div class="carousel-caption">
        <h3>Girls Wearing</h3>
        <p>A woman's perfume tells more about her than her handwriting.</p>
      </div>
    </div>

    <div class="item">
      <img src="<c:url value="/images/Car.jpg"></c:url>" alt="Electronics Things">
       <div class="carousel-caption">
        <h3>Technology </h3>
        <p>The ultimate promise of technology is to make us master of a world that we command by the push of a button.</p>
      </div>
    </div>

    <div class="item">
      <img src="<c:url value="/images/Furniture.jpg"></c:url>" alt="Furniture">
       <div class="carousel-caption">
        <h3>Furniture</h3>
        <p>I'm fascinated by furniture design and interiors, and I want to try designing all that stuff.</p>
      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  </div>
</div>             <!--Carousel ends here-->
