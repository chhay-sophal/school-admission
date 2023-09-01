$(document).ready(function () {
    $("#btnSubmitReg").hide();
    const progressNumber = $(".step").length;
    const slidePage = $(".slide-page");
    const submitBtn = $(".submit");
    const progressText = $(".step p");
    const progressCheck = $(".step .check");
    const bullet = $(".step .bullet");
    const pages = $(".page");
    const nextButtons = $(".next");
    const prevButtons = $(".prev");
    const stepsNumber = pages.length;

    if (progressNumber !== stepsNumber) {
        console.warn(
            "Error, number of steps in progress bar do not match number of pages"
        );
    }

    document.documentElement.style.setProperty("--stepNumber", stepsNumber);

    let current = 1;

    nextButtons.on("click", function (event) {
        event.preventDefault();

        inputsValid = validateInputs($(this));
        // inputsValid = true;

        if (inputsValid) {
            slidePage.css("margin-left", `-${(100 / stepsNumber) * current}%`);
            bullet.eq(current - 1).addClass("active");
            progressCheck.eq(current - 1).addClass("active");
            progressText.eq(current - 1).addClass("active");
            current += 1;
        }
    });

    prevButtons.on("click", function (event) {
        event.preventDefault();
        slidePage.css(
            "margin-left",
            `-${(100 / stepsNumber) * (current - 2)}%`
        );
        bullet.eq(current - 2).removeClass("active");
        progressCheck.eq(current - 2).removeClass("active");
        progressText.eq(current - 2).removeClass("active");
        current -= 1;
    });

    submitBtn.on("click", function () {
        bullet.eq(current - 1).addClass("active");
        progressCheck.eq(current - 1).addClass("active");
        progressText.eq(current - 1).addClass("active");
        current += 1;
        setTimeout(function () {
            alert("Your Form Successfully Signed up");
            location.reload();
        }, 800);
    });

    function validateInputs(ths) {
        let inputsValid = true;

        const inputs = ths.parent().parent().find("input");
        for (let i = 0; i < inputs.length; i++) {
            const valid = inputs[i].checkValidity();
            if (!valid) {
                inputsValid = false;
                inputs.eq(i).addClass("invalid-input");
            } else {
                inputs.eq(i).removeClass("invalid-input");
            }
        }
        return inputsValid;
    }

    //
    $("#imageUpload").change(function (data) {
        var imageFile = data.target.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(imageFile);

        reader.onload = function (evt) {
            $("#imagePreview").attr("src", evt.target.result);
        };
    });

    //
    $("#declare, #terms").click(function () {
        if ($("#terms").prop("checked") && $("#declare").prop("checked")) {
            $("#btnSubmitReg").show();
        } else {
            $("#btnSubmitReg").hide();
        }
    });
});
