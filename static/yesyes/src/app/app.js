import Vue from "vue"
import dropdown from "./components/dropdown.vue"

document.addEventListener("DOMContentLoaded", function()
{
    
    
    let app = new Vue
    ({
        el: "#app",
        data: 
        {
            availableSizes: [8, 10, 12, 14, 16],
            boardSize: 10
        },
        methods:
        {
            onSizeSelected: function(size)
            {
                this.boardSize = size;
            }
        }
    });
});
