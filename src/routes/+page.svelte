<script lang="ts">
	import type { Room } from '$lib/types';
	import { currentRoom } from '$lib/shared.svelte';
	import ChatCard from './ChatCard.svelte';
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

<section class="rounded-xl w-full p-2 pt-4 flex gap-3 bg-white">
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
					<ChatCard
						{room}
						onclick={() => {
							onclick(room.name);
						}}
					/>
				{:else}
					<p>No result found</p>
				{/each}
			{/if}
		</div>
	</div>
	<RoomContainer />
</section>
