<script lang="ts">
	import '../app.css';
	import SideBar from './SideBar.svelte';
	let { children } = $props();
</script>

<div class="flex gap-2 p-2 h-full">
	<SideBar />
	<section class="rounded-xl w-full p-2 pt-4 flex gap-3 bg-white">
		{@render children()}
	</section>
</div>
