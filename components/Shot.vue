<script setup lang="ts">
import { computed } from 'vue'

// Кадр слайда на весь холст. Путь задаётся относительно public/,
// base подставляется сам, поэтому сборка с --base /repo/ не ломает картинки.
const props = defineProps<{ src: string, alt?: string }>()
const url = computed(() => import.meta.env.BASE_URL + props.src.replace(/^\//, ''))
</script>

<template>
  <img class="shot" :src="url" :alt="alt ?? ''" draggable="false">
</template>
