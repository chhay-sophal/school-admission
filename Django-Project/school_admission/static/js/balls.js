const canvas = document.getElementById("neonSmoke");
const ctx = canvas.getContext("2d");

canvas.width = innerWidth;
canvas.height = innerHeight;

const particles = [];

class Particle {
    constructor(x, y, color) {
        this.x = x;
        this.y = y;
        this.size = Math.random() * 5 + 1;
        this.speedX = Math.random() * 3 - 1.5;
        this.speedY = Math.random() * 3 - 1.5;
        this.color = color;
    }

    update() {
        this.x += this.speedX;
        this.y += this.speedY;
        if (this.size > 0.1) this.size -= 0.1;
    }

    draw() {
        ctx.fillStyle = this.color;
        ctx.strokeStyle = this.color;
        ctx.lineWidth = 2;
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
        ctx.closePath();
        ctx.fill();
        ctx.stroke();
    }
}

function handleParticles() {
    for (let i = 0; i < particles.length; i++) {
        particles[i].update();
        particles[i].draw();

        if (particles[i].size <= 0.1) {
            particles.splice(i, 1);

            i--;
        }
    }
}

function getColor(x) {
    const hue = (x / canvas.width) * 360;
    return `hsla(${hue}, 100%, 50%, 1)`;
}

function addParticle(e) {
    const posX = e.clientX || e.touches[0].clientX;
    const posY = e.clientY || e.touches[0].clientY;
    const color = getColor(posX);
    particles.push(new Particle(posX, posY, color));
}

canvas.addEventListener("mousemove", addParticle);
canvas.addEventListener("touchstart", addParticle);
canvas.addEventListener("touchmove", addParticle);

function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    handleParticles();
    requestAnimationFrame(animate);
}

animate();