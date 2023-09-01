$(document).ready(function () {
    function showAlert() {
        Swal.fire({
            icon: "info",
            title: "IMPORTANT",
            html:
                "<div class='text-start'>" +
                "<h5>Associate Degree:</h5>" +
                "<ul><li>Have a high school certificate or equivalent</li></ul>" +
                "<h5>Bachelor Degree:</h5>" +
                "<ul><li>Have a high school diploma or equivalent</li><li>Pass The INFINITY Institute's Undergraduate Entrance Examination</li></ul>" +
                "<h5>Master Degree:</h5>" +
                "<ul><li>Have a Bachelor's degree or an equivalent</li><li>Pass The INFINITY Institute's Graduate Entrance Examination, and also</li><li>Pass The University's English Proficiency Test</li></ul>" +
                "</div>",
            confirmButtonText: 'Next &nbsp;&nbsp;&nbsp;<i class="fa-solid fa-arrow-right"></i>',
            confirmButtonColor: "var(--primary)",
            footer: "<h5>Admissions Requirements</h5>",
            allowEscapeKey: true,
            allowOutsideClick: false,
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Attention!",
                    icon: "warning",
                    html: "<b>Khmer Language</b> allow only in Khmer Name(First Name, Last Name) only, or your Registration Admission will be decline.",
            confirmButtonText: 'Understand',
            confirmButtonColor: "var(--primary)",
                });
            }
        });
    }

    showAlert();

    $('#info').on('click', function(){
        showAlert();
    })
});
