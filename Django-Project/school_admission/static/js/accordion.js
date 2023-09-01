$(document).ready(function () {
    // Toggle accordion item when header is clicked
    $(".accordion-header").click(function () {
        // Collapse all other accordion items except the active one
        $(".accordion-header").not(this).removeClass("active");
        $(".accordion-content")
            .not($(this).siblings(".accordion-content"))
            .slideUp();
        $(".accordion-arrow")
            .not($(this).find(".accordion-arrow"))
            .removeClass("active");

        // Toggle active class on header
        $(this).toggleClass("active");

        // Toggle visibility of content
        $(this).siblings(".accordion-content").slideToggle();

        // Rotate arrow icon
        $(this).find(".accordion-arrow").toggleClass("active");
    });

    // Add click event listener to table rows
    $("#tblComment tbody tr").click(function () {
        // Get the values of the cells in the current row
        var no = $(this).find("td:eq(0)").text();
        var name = $(this)
            .find("td:eq(1)")
            .contents()
            .filter(function () {
                return this.nodeType == 3;
            })
            .text()
            .trim();
        var rating = $(this).find("td:eq(2)").text();
        var comment = $(this).find("td:eq(3)").text();
        var date = $(this).find("td:eq(4)").text();
        var status = $(this).find("td:eq(5)").text();

        var output = "<ul>";
        output += '<li><span class="label">No:</span>' + no + "</li>";
        output += '<li><span class="label">Name:</span>' + name + "</li>";
        output += '<li><span class="label">Rate:</span>' + rating + "</li>";
        output += '<li><span class="label">Comment:</span>' + comment + "</li>";
        output += '<li><span class="label">Date:</span>' + date + "</li>";
        output += '<li><span class="label">Status:</span>' + status + "</li>";
        output += "</ul>";

        Swal.fire({
            icon: "info",
            title: "Comment Detail",
            html: output,
            showCloseButton: true,
            showConfirmButton: false,
            focusConfirm: false,
        });
    });
});
