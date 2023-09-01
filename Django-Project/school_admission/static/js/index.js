$(document).ready(function () {
    // calculate the height of the rating-form div
    var formHeight = $("#rating-form").outerHeight();
    // set the height of all rateContent divs to the height of the rating-form div
    $(".rateContent").css("height", formHeight + "px");

    // hide the input fields initially
    $("#fields").hide();
    $('.ratingStar input[type="radio"], #btnSubmitRating').click(function () {
        if (!$('.ratingStar input[type="radio"]:checked').length) {
            Swal.fire({
                icon: "info",
                title: "Information!",
                text: "Please choose a rating level first!",
                showConfirmButton: true,
                confirmButtonColor: "#018690",
                allowEscapeKey: true,
                allowOutsideClick: false,
            });
        } else {
            $("#btnSubmitRating").text("Submit");
            $("#fields").show();
            $(".rateContent").css("height", $("#rating-form").Height() + "px");
        }
    });

    // Timer
    function makeTimer() {
        var endTime = new Date('<?php echo $expiredDate . " 00:00:00"; ?>');

        endTime = Date.parse(endTime) / 1000;

        var now = new Date();
        now = Date.parse(now) / 1000;

        var timeLeft = endTime - now;

        var days = Math.floor(timeLeft / 86400);
        var hoursLeft = Math.floor(timeLeft - days * 86400);
        var hours = Math.floor(hoursLeft / 3600);
        var minutesLeft = Math.floor(hoursLeft - hours * 3600);
        var minutes = Math.floor(minutesLeft / 60);
        var seconds = Math.floor(
            timeLeft - days * 86400 - hours * 3600 - minutes * 60
        );

        if (days < 10) {
            days = "0" + days;
        }
        if (hours < 10) {
            hours = "0" + hours;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }

        $("#days").html(days);
        if (!$("#days").next().hasClass("countdown-label")) {
            if (days <= 1) {
                $("#days").after('<span class="countdown-label">Day</span>');
            } else {
                $("#days").after('<span class="countdown-label">Days</span>');
            }
        }
        $("#hours").html(hours);
        if (!$("#hours").next().hasClass("countdown-label")) {
            if (hours <= 1) {
                $("#hours").after('<span class="countdown-label">Hour</span>');
            } else {
                $("#hours").after('<span class="countdown-label">Hours</span>');
            }
        }
        $("#minutes").html(minutes);
        if (!$("#minutes").next().hasClass("countdown-label")) {
            if (minutes <= 1) {
                $("#minutes").after(
                    '<span class="countdown-label">Minute</span>'
                );
            } else {
                $("#minutes").after(
                    '<span class="countdown-label">Minutes</span>'
                );
            }
        }
        $("#seconds").html(seconds);
        if (!$("#seconds").next().hasClass("countdown-label")) {
            if (seconds <= 1) {
                $("#seconds").after(
                    '<span class="countdown-label">Second</span>'
                );
            } else {
                $("#seconds").after(
                    '<span class="countdown-label">Seconds</span>'
                );
            }
        }
    }

    setInterval(function () {
        makeTimer();
    }, 1000);

    // Subscribe
    $("#subscribeForm").submit(function (event) {
        // Prevent the form from submitting normally
        event.preventDefault();

        // Get the form data
        var formData = {};
        formData.name = $("#nameSub").val();
        formData.email = $("#emailSub").val();

        // Send the AJAX request
        $.ajax({
            url: "forms/subscribe.php",
            method: "post",
            data: $(this).serialize(),
            success: function (response) {
                if (response.success == 1) {
                    Swal.fire({
                        icon: "success",
                        title: "Success",
                        text: "Thank you for your subscription!",
                        showConfirmButton: true,
                        confirmButtonColor: "#018690",
                        allowEscapeKey: true,
                        allowOutsideClick: false,
                    });
                } else {
                    Swal.fire({
                        icon: "error",
                        title: "Oops...Process Declinded",
                        text: response.message,
                        showConfirmButton: true,
                        confirmButtonColor: "#018690",
                        allowEscapeKey: true,
                        allowOutsideClick: false,
                    });
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Display error message
                Swal.fire({
                    icon: "error",
                    title: "Oops...",
                    text: "Your subscription failed: " + errorThrown,
                    showConfirmButton: true,
                    confirmButtonColor: "#018690",
                    allowEscapeKey: true,
                    allowOutsideClick: false,
                });
            },
        });
    });

    // just a value selector
    // $('input[name="rate"]').click(function() {
    //     console.log($(this).val());
    // });

    // Rate
    $("#rating-form").submit(function (event) {
        event.preventDefault();

        $.ajax({
            url: "forms/rating.php",
            method: "POST",
            data: $(this).serialize(),
            success: function (response) {
                if (response.success == 1) {
                    Swal.fire({
                        icon: "success",
                        title: "Success",
                        text: "Thank you for your rating!",
                        showConfirmButton: true,
                        confirmButtonColor: "#018690",
                        allowEscapeKey: true,
                        allowOutsideClick: false,
                    });
                    var ratingHtml = '<div class="col-md-4">';
                    ratingHtml +=
                        '<div class="rateContent mx-md-2 my-sm-2 my-2 p-3 d-flex flex-column justify-content-between" data-aos="zoom-in">';
                    ratingHtml += "<div>";
                    ratingHtml += '<div class="stars mb-3">';

                    var ratingStar = response.data.rating;
                    for (var i = 1; i <= 5; i++) {
                        if (i <= ratingStar) {
                            ratingHtml +=
                                '<i class="fa-solid fa-star" style="color: var(--primary);"></i>';
                        } else {
                            ratingHtml +=
                                '<i class="far fa-star" style="color: var(--primary);"></i>';
                        }
                    }

                    ratingHtml += "</div>";
                    ratingHtml +=
                        '<h5 class="rater">' + response.data.name + "</h5>";
                    ratingHtml +=
                        '<p class="feedback">' +
                        response.data.comments +
                        "</p>";
                    ratingHtml += "</div>";
                    ratingHtml +=
                        '<div class="rateDate text-muted"><div><hr></div><small>' +
                        new Date(response.data.created_at).toLocaleString() +
                        "</small></div>";
                    ratingHtml += "</div>";
                    ratingHtml += "</div>";

                    $("#rating-container .row").prepend(ratingHtml);
                    $(".rateContent").css(
                        "height",
                        $("#rating-form").Height() + "px"
                    );
                    // Get the row element
                    let row = $(
                        ".row.d-flex.justify-content-between.flex-fill"
                    );

                    // Remove the last col-md-4 element
                    row.find(".col-md-4").last().remove();
                } else {
                    Swal.fire({
                        icon: "error",
                        title: "Fail",
                        text: "Your rating failed.",
                        showConfirmButton: true,
                        confirmButtonColor: "#018690",
                        allowEscapeKey: true,
                        allowOutsideClick: false,
                    });
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Display error message
                Swal.fire({
                    icon: "error",
                    title: "Oops...",
                    text: "Your subscription failed: " + errorThrown,
                    showConfirmButton: true,
                    confirmButtonColor: "#018690",
                    allowEscapeKey: true,
                    allowOutsideClick: false,
                });
            },
        });
    });
});
