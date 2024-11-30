<script lang="ts">
	let { value = $bindable() } = $props();
</script>

<div class="h-10 w-full bg-blue-100/50 rounded-xl flex items-center px-2">
	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="size-6 fill-black/50">
		<path
			fill-rule="evenodd"
			d="M10.5 3.75a6.75 6.75 0 1 0 0 13.5 6.75 6.75 0 0 0 0-13.5ZM2.25 10.5a8.25 8.25 0 1 1 14.59 5.28l4.69 4.69a.75.75 0 1 1-1.06 1.06l-4.69-4.69A8.25 8.25 0 0 1 2.25 10.5Z"
			clip-rule="evenodd"
		/>
	</svg>
	<input
		bind:value
		type="text"
		class="h-full bg-transparent text-black/50 text-sm pl-2 placeholder:text-black/50 focus:outline-none w-full"
		placeholder="Search"
	/>
	{#if value.length !== 0}
		<svg
      role="button"
      tabindex="0"
      onkeydown={() => {
        value = '';
      }}
			onclick={() => {
				value = '';
			}}
			xmlns="http://www.w3.org/2000/svg"
			viewBox="0 0 24 24"
			stroke-width="1.2"
			class="size-6 stroke-black/50"
		>
			<path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
		</svg>
	{/if}
</div>
