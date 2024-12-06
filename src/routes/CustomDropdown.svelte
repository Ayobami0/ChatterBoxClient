<script lang="ts">
	let rotated = $state(false);

	const { heading, children } = $props();
</script>

<div class="w-full px-2 flex flex-col gap-1 rounded-xl w-full mt-2">
	<div class="w-full flex justify-between items-center w-full">
		{@html heading}
		<div class="flex-1"></div>
		<svg
			role="button"
			tabindex="0"
			style:transform={rotated ? 'rotate(180deg)' : 'rotate(0deg)'}
			style:transition="transform 0.5s ease"
			onclick={() => {
				rotated = !rotated;
			}}
			onkeydown={(e) => {
				if (e.key === 'Enter' || e.key === ' ') {
					rotated = !rotated;
				}
			}}
			xmlns="http://www.w3.org/2000/svg"
			fill="none"
			viewBox="0 0 24 24"
			stroke-width="1.0"
			stroke="currentColor"
			class="size-4"
		>
			<path stroke-linecap="round" stroke-linejoin="round" d="m19.5 8.25-7.5 7.5-7.5-7.5" />
		</svg>
	</div>
	<div
		class="flex w-full overflow-x-scroll gap-1 overflow-hidden"
		style:transition="all 0.4s ease-in-out"
    style:max-height={rotated ? '1000px': '0px'}
	>
		{@render children()}
	</div>
</div>
