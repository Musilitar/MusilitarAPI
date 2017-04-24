let array;
let indexes;

let boxTop;
let boxRight;
let boxBottom;
let boxLeft;

function initialize() {
    array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    indexes = [0, 5, 5, 0];

    boxTop = document.getElementById("boxTop");
    boxRight = document.getElementById("boxRight");
    boxBottom = document.getElementById("boxBottom");
    boxLeft = document.getElementById("boxLeft");

    document.addEventListener("keydown", function(event) {
        switch (event.code) {
            case "ArrowUp":
                traverseUp();
                break;
            case "ArrowRight":
                traverseRight();
                break;
            case "ArrowDown":
                traverseDown();
                break;
            case "ArrowLeft":
                traverseLeft();
                break;
        }
    });

    drawValues();
}

function displayValue(element, value) {
    element.innerHTML = value;
}

function drawValues() {
    displayValue(boxTop, array[indexes[0]]);
    displayValue(boxRight, array[indexes[1]]);
    displayValue(boxBottom, array[indexes[2]]);
    displayValue(boxLeft, array[indexes[3]]);
}

function traverseUp() {
    indexes[0] -= 1;
    indexes[2] += 1;
    drawValues();
}

function traverseRight() {
    indexes[1] += 1;
    indexes[3] -= 1;
    drawValues();
}

function traverseDown() {
    indexes[2] -= 1;
    indexes[0] += 0;
    drawValues();    
}

function traverseLeft() {
    indexes[3] -= 1;
    indexes[1] += 1;
    drawValues();    
}

document.addEventListener("DOMContentLoaded", initialize);