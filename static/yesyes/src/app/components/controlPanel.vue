<template>
    <div class="control-panel">
        <div class="control-panel-size">
            <dropdown class="input" v-bind:model="boardSize" v-bind:options="availableSizes" v-on:option-selected="onSizeSelected"></dropdown>
        </div>
    </div>
</template>

<script>
    export default
    {
        name: "control-panel"
    }
</script>