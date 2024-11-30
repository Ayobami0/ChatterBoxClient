<script lang="ts">
	import { currentRoom } from '$lib/shared.svelte';
	import MessageBubble from './MessageBubble.svelte';

	let content = $state('');
</script>

<div class="flex-1 flex flex-col {currentRoom.value == '' ? 'justify-center items-center' : ''}">
	{#if currentRoom.value == ''}
		<svg
			xmlns="http://www.w3.org/2000/svg"
			fill="none"
			viewBox="0 0 24 24"
			stroke="currentColor"
			class="size-1/4 stroke-1"
		>
			<path
				stroke-linecap="round"
				stroke-linejoin="round"
				d="M8.625 9.75a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm0 0H8.25m4.125 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm0 0H12m4.125 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm0 0h-.375m-13.5 3.01c0 1.6 1.123 2.994 2.707 3.227 1.087.16 2.185.283 3.293.369V21l4.184-4.183a1.14 1.14 0 0 1 .778-.332 48.294 48.294 0 0 0 5.83-.498c1.585-.233 2.708-1.626 2.708-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z"
			/>
		</svg>
		<p>Pick a conversation to start</p>
	{:else}
		<div class="h-full flex gap-2">
			<div class="flex flex-col h-full flex-1">
				<div class="flex w-full items-center">
					<div class="flex flex-col flex-1 gap-0">
						<p>{currentRoom.value}</p>
						<p class="text-[10px]">online</p>
					</div>
					<svg
						xmlns="http://www.w3.org/2000/svg"
						fill="none"
						viewBox="0 0 24 24"
						stroke-width="1.5"
						stroke="currentColor"
						class="size-6"
					>
						<path
							stroke-linecap="round"
							stroke-linejoin="round"
							d="M12 6.75a.75.75 0 1 1 0-1.5.75.75 0 0 1 0 1.5ZM12 12.75a.75.75 0 1 1 0-1.5.75.75 0 0 1 0 1.5ZM12 18.75a.75.75 0 1 1 0-1.5.75.75 0 0 1 0 1.5Z"
						/>
					</svg>
				</div>
				<div class="flex flex-col justify-end flex-1 mb-2">
					<MessageBubble />
				</div>
				<div class="flex w-full rounded-lg bg-blue-300/25 p-2 px-3 items-center">
					<svg
						xmlns="http://www.w3.org/2000/svg"
						fill="none"
						viewBox="0 0 24 24"
						stroke-width="1"
						stroke="currentColor"
						class="size-5"
					>
						<path
							stroke-linecap="round"
							stroke-linejoin="round"
							d="m18.375 12.739-7.693 7.693a4.5 4.5 0 0 1-6.364-6.364l10.94-10.94A3 3 0 1 1 19.5 7.372L8.552 18.32m.009-.01-.01.01m5.699-9.941-7.81 7.81a1.5 1.5 0 0 0 2.112 2.13"
						/>
					</svg>
					<input
						type="text"
						placeholder="Message"
						class="w-full focus:outline-none px-3 bg-transparent text-xs"
						bind:value={content}
					/>
					<svg
						xmlns="http://www.w3.org/2000/svg"
						fill="none"
						viewBox="0 0 24 24"
						stroke-width="1"
						class="size-6 {content.length === 0 ? 'stroke-gray-400' : 'stroke-current'}"
					>
						<path
							stroke-linecap="round"
							stroke-linejoin="round"
							d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5"
						/>
					</svg>
				</div>
			</div>
			<div class="bg-blue-300 md:w-[200px] h-full rounded-xl flex flex-col items-center">
				<figure class="flex-shrink-0 w-32 pt-16">
					<img src="https://picsum.photos/200" alt="" class="rounded-full w-full h-full" />
					<!--TODO: Image if conversation is not group-->
				</figure>
				<p class="text-center text-lg">Room Name</p>
				<p class="text-center text-xs text-green-500">28 online</p>
				<div class="w-full flex justify-between items-center">
					<p class="text-xs text-gray-700">Attachments</p>
					<svg
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
				<div class="flex w-full overflow-x-scroll gap-1 p-1">
					{@render attachment()}
					{@render attachment()}
					{@render attachment()}
					{@render attachment()}
					{@render attachment()}
				</div>
			</div>
		</div>
	{/if}
</div>

{#snippet attachment()}
	<figure class="flex-shrink-0 h-16 w-24">
		<img src="https://picsum.photos/200" alt="" class="rounded-lg object-cover w-full h-full"/>
	</figure>
{/snippet}
