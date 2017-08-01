"use strict";

let boardSize;
let boardSizeStep = 2;
let boardSizeMin = 8;
let boardSizeMax = 16;
let boardSizeDisplay;
let board;

function initialize()
{
    boardSize = 
    {
        currentValue: 8,
        get getBoardSize()
        {
            return this.currentValue;
        },
        set setBoardSize(value)
        {
            this.currentValue = value;
            drawBoard();
        }
    }
    boardSizeDisplay = document.querySelector("#boardSize");
    board = document.querySelector("#board");
    
    updateElementWithValue(boardSizeDisplay, boardSize.currentValue);
    drawBoard();
}

function updateElementWithValue(element, value)
{
    element.innerHTML = value;
}

function clearElementChildren(element)
{
    while(element.hasChildNodes())
    {
        element.removeChild(element.lastChild);
    }
}

function increaseBoardSize()
{
    if(boardSize.currentValue + boardSizeStep <= boardSizeMax) 
    {
        boardSize.setBoardSize = boardSize.currentValue + boardSizeStep;
        updateElementWithValue(boardSizeDisplay, boardSize.currentValue);
    }
}

function decreaseBoardSize()
{
    if(boardSize.currentValue - boardSizeStep >= boardSizeMin) 
    {
        boardSize.setBoardSize = boardSize.currentValue - boardSizeStep;
        updateElementWithValue(boardSizeDisplay, boardSize.currentValue);
    }
}

function drawBoard()
{
    clearElementChildren(board);
    for(let i = 0; i < boardSize.currentValue; i++) 
    {
        let boardPiece = document.createElement("div");
        boardPiece.innerHTML = "+";
        boardPiece.classList = ["boardPiece", "boardPiecePristine"];
        board.appendChild(boardPiece);
    }
}

document.addEventListener("DOMContentLoaded", function()
{
    initialize();
});
