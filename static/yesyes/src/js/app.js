"use strict";

document.addEventListener("DOMContentLoaded", function()
{
    Vue.component("dropdown", 
    {
        template: "#dropdown",
        props: ["model", "options"],
        data: function()
        {
            let data =
            {
                open: false
            };

            return data;
        },
        methods: 
        {
            selectOption: function(option)
            {
                this.$emit("option-selected", option);
            },
            toggleOpen: function()
            {
                this.open = !this.open;
            },
            close: function()
            {
                this.open = false;
            }
        }
    });
    
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
