<script lang="ts">
	import type { Room } from '$lib/types';
	import { currentRoom } from '$lib/shared.svelte';
	import SearchBar from './SearchBar.svelte';
	import RoomContainer from './RoomContainer.svelte';

	let roomSearch = $state('');

	const rooms: Room[] = [
		{
			name: 'General Chat',
			latestMessage: {
				timeSent: new Date('2024-11-28T10:30:00'),
				content: "Hey everyone, how's it going?"
			},
			type: 'GROUP'
		},
		{
			name: 'Project Updates',
			latestMessage: {
				timeSent: new Date('2024-11-28T11:45:00'),
				content: 'Completed the first milestone for the Q4 project!'
			}
		},
		{
			name: 'Random Discussions',
			latestMessage: {
				timeSent: new Date('2024-11-28T09:15:00'),
				content: 'Anyone have plans for the weekend?'
			}
		},
		{
			name: 'Tech Support',
			latestMessage: {
				timeSent: new Date('2024-11-28T12:00:00'),
				content: 'Having issues with the latest software update.'
			}
		}
	];

	function onclick(room: string) {
		currentRoom.value = room;
	}
</script>

<div class="flex flex-col gap-2 w-[230px]">
	<SearchBar bind:value={roomSearch} />
	<div
		class="flex flex-col h-full {rooms.length === 0 ||
		rooms.filter((v) => v.name.toLowerCase().includes(roomSearch)).length === 0
			? 'justify-center items-center gap-3'
			: ''}"
	>
		{#if rooms.length === 0}
			<p class="text-center">
				You haven't intitatied any conversations or joined any rooms. Join one to start
			</p>
			<button class="border px-5 py-1 rounded-lg hover:bg-gray-100">Join</button>
		{:else}
			{#each rooms.filter((v) => v.name.toLowerCase().includes(roomSearch)) as room}
				{@render chatCard(room, () => {
					onclick(room.name);
				})}
			{:else}
				<p>No result found</p>
			{/each}
		{/if}
	</div>
</div>
<RoomContainer />

{#snippet chatCard(room: Room, onclick?)}
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
				<p>{room.name.toUpperCase().substring(0, 2)}</p>
			</div>
		{:else}
			<figure class="flex-shrink-0 w-11 h-11">
				<img
					src="https://picsum.photos/200"
					alt=""
					class="object-cover w-full h-full rounded-full"
				/>
			</figure>
		{/if}
		<div class="flex flex-col justify-between flex-1 min-w-0 overflow-hidden h-full">
			<span class="flex justify-between items-center">
				<span class="truncate text-sm font-medium">{room.name}</span>
				<span class="text-[10px] text-zinc-500 pl-[2px]">1h</span>
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
{/snippet}
