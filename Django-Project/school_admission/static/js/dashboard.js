$(document).ready(function () {
    // When a tab link is clicked
    $(".nav-link-tabs").click(function (e) {
        e.preventDefault(); // Prevent the default link behavior

        var target = $(this).attr("href"); // Get the target tab id

        // Show the target tab content and hide other tabs
        $(".tab-pane").removeClass("active");
        $(target).addClass("active");

        // Update the active class for the clicked tab link
        $(".nav-link-tabs").removeClass("active");
        $(this).addClass("active");
    });

    $("#editForm").hide();
    $("#btnSubmitEdit").addClass("disabled");

    function divUpdateProfile() {
        $("#editForm").toggle();
        var buttonText = $("#btnEdit").text();
        $("#btnEdit").text(buttonText === "Edit" ? "Cancel" : "Edit");
    }

    $("#btnEdit").click(function () {
        divUpdateProfile();
    });
    $("#btnCancelEdit").click(function () {
        divUpdateProfile();
    });
    $("#ckbxConfirm").click(function () {
        $("#btnSubmitEdit").toggleClass("disabled");
    });
});
