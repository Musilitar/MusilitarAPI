<template>
    <div class="board">
        <div v-for="size in boardSize">+</div>
    </div>
</template>

<script>
    export default
    {
        name: "board"
    }
</script>