<script lang="ts">
	import { type Room } from '$lib/types';

	const { room, onclick }: { room: Room; onclick? } = $props();
</script>

<div
	class="flex gap-3 rounded-lg p-3 items-center hover:bg-slate-100"
	{onclick}
	onkeydown={onclick}
	tabindex="0"
	aria-label={room.name}
	role="button"
>
	{#if room.type === 'GROUP'}
		<div class="rounded-full flex-shrink-0 w-11 h-11 bg-red-700 flex items-center justify-center">
      <p>{room.name.toUpperCase().substring(0,2)}</p>
    </div>
	{:else}
		<figure class="flex-shrink-0 w-11 h-11">
			<img src="https://picsum.photos/200" alt="" class="object-cover w-full h-full rounded-full" />
		</figure>
	{/if}
	<div class="flex flex-col justify-between flex-1 min-w-0 overflow-hidden h-full">
		<span class="flex justify-between items-center">
			<span class="truncate text-sm font-medium">{room.name}</span>
			<span class="text-xs text-zinc-500">1h</span>
		</span>
		<span class="flex justify-between items-center">
			<span class="truncate text-xs text-zinc-500">{room.latestMessage.content}</span>
			<span
				class="ml-2 rounded-full flex items-center justify-center text-white bg-red-400 text-[9px] px-2"
				>3
			</span>
		</span>
	</div>
</div>
