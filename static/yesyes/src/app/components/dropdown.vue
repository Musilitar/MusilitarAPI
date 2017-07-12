<template>
    <div class="dropdown-container">
        <div class="dropdown-model" v-on:click="toggleOpen" v-on:blur="close">
            <span>{{ model }}</span>
            <svg v-if="open" class="icon"><use xlink:href="/static/yesyes/dist/icons.svg#collapse"></use></svg>
            <svg v-else class="icon"><use xlink:href="/static/yesyes/dist/icons.svg#expand"></use></svg>
        </div>
        <div class="dropdown-options" v-if="open">
            <div class="dropdown-option" v-for="option in options" v-on:click="selectOption(option)">{{ option }}</div>
        </div>
    </div>
</template>

<script>
    export default 
    {
        name: "dropdown",
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
    }
</script>