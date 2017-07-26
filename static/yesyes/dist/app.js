"use strict";

let boardSize = 10;
let boardSizeStep = 2;
let boardSizeMin = 8;
let boardSizeMax = 16;
let boardSizeDisplay;

function initialize()
{
    boardSizeDisplay = document.querySelector("#boardSize");
    
    updateElementWithValue(boardSizeDisplay, boardSize);
}

function updateElementWithValue(element, value)
{
    element.innerHTML = value;
}

function increaseBoardSize()
{
    if(boardSize + boardSizeStep <= boardSizeMax) 
    {
        boardSize += boardSizeStep;
        updateElementWithValue(boardSizeDisplay, boardSize);
    }
}

function decreaseBoardSize()
{
    if(boardSize - boardSizeStep >= boardSizeMin) 
    {
        boardSize -= boardSizeStep;
        updateElementWithValue(boardSizeDisplay, boardSize);
    }
}

document.addEventListener("DOMContentLoaded", function()
{
    initialize();
});
