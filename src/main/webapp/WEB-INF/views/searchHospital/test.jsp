<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Map App</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/mapstyle.css"/>
    <!-- Holder JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC8Enzqyc1p-YFkwmK6dkwxks3-JMadPc&callback=initMap"
            async defer></script>
    xxx`x`
    <!-- JS Source -->
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

    <%--    <script type="text/javascript" src="/js/content.js"></script>--%>

    <script type="text/javascript">
        var map;
        var infowindow;
        var latlon;
        var place;
        var input = document.getElementById('inputText');


        function initMap() {


            map = new google.maps.Map(document.getElementById('map'), {
                center: {
                    lat: 37.545,
                    lng: 127.138
                },
                zoom: 15
            });


            var autocomplete = new google.maps.places.Autocomplete(input);
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    console.log("내 위치 가져오기 성공 ! ");
                    console.log('position', position);
                    latlon = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                    // var myLocation = latlon;
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: latlon,
                        zoom: 15
                    });
                    infowindow = new google.maps.InfoWindow();
                    infowindow.setPosition(latlon);
                    infowindow.setContent('current Location');
                    map.setCenter(latlon);


                    var service = new google.maps.places.PlacesService(map);
                    service.nearbySearch({
                        // location: myLocation,
                        location: latlon,
                        radius: 1000,
                        type: ['hospital']
                    }, callback);
                }, function () {
                    handleLocationError(true, infoWindow, map.getCenter());
                });
            } else {
                // Browser doesn't support Geolocation
                handleLocationError(false, infoWindow, map.getCenter());
            }


            //handles error if geolocation is not supported
            function handleLocationError(browserHasGeolocation, infoWindow, pos) {
                infoWindow.setPosition(pos);
                infoWindow.setContent(browserHasGeolocation ?
                    'Error: The Geolocation service failed.' :
                    'Error: Your browser doesn\'t support geolocation.');
                infoWindow.open(map);
            }


            console.log('autocomplete', autocomplete);
            autocomplete.bindTo
            ('bounds', map);

            //autocomplete looks for place change
            autocomplete.addListener('places_changed', function () {
                console.log('inside');
                infowindow.close();
                marker.setVisible(false);
                place = autocomplete.getPlace();
                console.log(place, 'place');
            });

            //when user clicks on search button
            $(document).on("click", '#add-location', function (e) {
                e.preventDefault();
                place = autocomplete.getPlace();
                console.log(place, 'place');
                var lat = place.geometry.location.lat();
                var lng = place.geometry.location.lng();
                var placeCoord = {
                    lat: lat,
                    lng: lng
                };
                retrieveRestuarents(placeCoord);
            });


            //gets the place coordinates  argument and passes it to the service call
            function retrieveRestuarents(placeCoord) {
                if (!place.geometry) {
                    return;
                } else if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17);
                }
                var service = new google.maps.places.PlacesService(map);
                service.nearbySearch({
                    location: placeCoord,
                    radius: 1000,
                    type: ['restuarent']
                }, callback);
            }

            // callback function after success
            function callback(results, status) {
                if (status === google.maps.places.PlacesServiceStatus.OK) {
                    populateRightHand(results);
                    console.log('results', results);
                    for (var i = 0; i < results.length; i++) {
                        createMarker(results[i]);
                    }
                }
            }

            // creates markers on map
            function createMarker(place) {
                var placeLoc = place.geometry.location;
                var icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };
                var marker = new google.maps.Marker({
                    map: map,
                    title: place.name,
                    icon: icon,
                    position: place.geometry.location
                });
                console.log(marker);
                marker.setVisible(true);
                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.setContent("<div><h4>" + place.name + "</h4><p>" + place.vicinity + "</p></div>");
                    infowindow.open(map, this);x
                });
            }

            // populates the right panel based on the input change

            function populateRightHand(results) {
                if ($('.postContainer')) {
                    $('.postContainer').remove();
                }
                for (var i = 1; i < results.length; i++) {
                    if (results[i].photos) {
                        var photoUrl = results[i].photos[0].getUrl({
                            maxWidth: 100,
                            maxHeight: 100
                        });
                    } else {
                        var photoUrl = "https://dummyimage.com/100x100/bfd2d6/0011ff";
                    }


                    console.log(results);
                    var hText = '<div class="postContainer"><div class="postThumb"><img src=' + photoUrl + '></div><div class="postContent"><h5 class="postTitle">' + results[i].name + '</h5><p class="text">' + results[i].vicinity + '</p><p class="text">Ratings:' + results[i].rating + '</p></div></div>'
                    $('#rightHand').append(hText);
                }

            }
        }
    </script>

</head>
<body>
<div class="container">
    <div class="header hColor">
        <div class="text-muted headerOne">EATR</div>
        <div>
            <form class="form-inline">
                <input type="text" class="form-control" placeholder="Search" name="inputText" id="inputText">
                <button class="btn btn-default" type="submit" id="add-location">
                    <i class="glyphicon glyphicon-search"></i>
                </button>
                </input>
            </form>
        </div>
    </div>
    <!-- Map and Side Panel -->
    <div class="row content">
        <!-- Google Map -->
        <div class="col-md-7">
            <div id="map"></div>
        </div>
        <!-- Side Panel -->
        <div class="col-md-5">
            <div class="panel panel-default" id="rightHand">
                <!-- Panel Title -->
            </div>
        </div>
    </div>
    <hr/>

</div>
</body>
</html>