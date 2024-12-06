<script lang="ts">
	import { type Room } from '$lib/types';
	import CircleAvatar from '../CircleAvatar.svelte';
	import SearchBar from '../SearchBar.svelte';

	let roomQuery = $state('');
</script>

<div class="flex gap-2 w-full">
	<div class="flex-1 flex-col flex w-full gap-3">
		<p>Join a public room</p>
		<SearchBar bind:value={roomQuery} />
		<div class="flex flex-col overflow-scroll">
			{@render publicRoom({
				name: 'General Chat',
      desc: 'A general chat group',
				latestMessage: {
					timeSent: new Date('2024-11-28T10:30:00'),
					content: "Hey everyone, how's it going?"
				},
				type: 'GROUP'
			})}
		</div>
	</div>
	<div class="border-l-[1px]"></div>
	<div class="flex flex-col items-start gap-3 md:max-w-[270px] md:min-w-[250px]">
		<p>Past coversations</p>
		<div class="flex flex-col overflow-scroll w-full">
			{@render pastConversations()}
		</div>
	</div>
</div>

{#snippet pastConversations()}
	<div class="flex items-center overflow-hidden gap-3 w-full">
		<CircleAvatar src="https://picsum.photos/200" radius={30} />
		<p class="truncate text-sm flex-1">User Name</p>
		<svg
			xmlns="http://www.w3.org/2000/svg"
			fill="none"
			viewBox="0 0 24 24"
			stroke-width="1.5"
			stroke="currentColor"
			class="size-4"
		>
			<path
				stroke-linecap="round"
				stroke-linejoin="round"
				d="M12 6.75a.75.75 0 1 1 0-1.5.75.75 0 0 1 0 1.5ZM12 12.75a.75.75 0 1 1 0-1.5.75.75 0 0 1 0 1.5ZM12 18.75a.75.75 0 1 1 0-1.5.75.75 0 0 1 0 1.5Z"
			/>
		</svg>
	</div>
{/snippet}

{#snippet publicRoom(room: Room)}
	<div class="rounded-lg border flex items-center p-3 gap-3 w-full">
		{#if room.imageUrl}
			<CircleAvatar src={room.imageUrl} radius={50}/>
		{:else}
			<div class="rounded-full flex items-center justify-center border w-[50px] h-[50px]">
				{room.name.toUpperCase().substring(0, 2)}
			</div>
		{/if}
		<div class="flex flex-col">
			<p>
				{room.name}
			</p>
			<p class="text-xs">
				{room.desc}
			</p>
			<span class="flex gap-1 items-center mt-1">
				<svg
					xmlns="http://www.w3.org/2000/svg"
					fill="currentColor"
					viewBox="0 0 24 24"
					stroke-width="1.2"
					stroke="currentColor"
					class="size-3"
				>
					<path
						stroke-linecap="round"
						stroke-linejoin="round"
						d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z"
					/>
				</svg>
			<p class="text-[10px]">50</p>
			</span>
		</div>
		<div class="flex-1"></div>
		<button class="border px-3 py-1 rounded hover:bg-blue-100/25">Join</button>
	</div>
{/snippet}
