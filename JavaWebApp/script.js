// script.js
document.addEventListener("DOMContentLoaded", function() {
    const textElement = document.querySelector(".text");
    
    // Change color every second for a dynamic effect
    setInterval(function() {
        textElement.style.color = getRandomColor();
    }, 1000);
    
    // Function to generate a random color
    function getRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }
});
