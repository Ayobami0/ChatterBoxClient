<script lang="ts">
	import '../app.css';
	import SideBar from './SideBar.svelte';
	let { children } = $props();
</script>

<div class="flex gap-2 p-2 h-full">
	<SideBar/>
	{@render children()}
</div>
