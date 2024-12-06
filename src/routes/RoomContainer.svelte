<script lang="ts">
	import { currentRoom } from '$lib/shared.svelte';
	import MessageBubble from './MessageBubble.svelte';
	import CustomDropdown from './CustomDropdown.svelte';

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
						<span class="flex items-center gap-3">
							<p>{currentRoom.value}</p>
							<svg
								xmlns="http://www.w3.org/2000/svg"
								fill="none"
								viewBox="0 0 24 24"
								stroke-width="1"
								stroke="currentColor"
								class="size-4"
							>
								<path
									stroke-linecap="round"
									stroke-linejoin="round"
									d="M16.5 10.5V6.75a4.5 4.5 0 1 0-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 0 0 2.25-2.25v-6.75a2.25 2.25 0 0 0-2.25-2.25H6.75a2.25 2.25 0 0 0-2.25 2.25v6.75a2.25 2.25 0 0 0 2.25 2.25Z"
								/>
							</svg>
						</span>
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
			<div class="md:w-[200px] h-full rounded-xl flex flex-col items-center">
				<figure class="flex-shrink-0 w-32 pt-16">
					<img src="https://picsum.photos/200" alt="" class="rounded-full w-full h-full" />
					<!--TODO: Image if conversation is not group-->
				</figure>
				<p class="text-center text-lg">{currentRoom.value}</p>
				<p class="text-center text-xs text-green-500">28 online</p>
				<CustomDropdown
					heading={` 
						<span class="flex items-center gap-1">
							<svg
								xmlns="http://www.w3.org/2000/svg"
								fill="none"
								viewBox="0 0 24 24"
								stroke-width="1"
								stroke="currentColor"
								class="size-4"
							>
								<path
									stroke-linecap="round"
									stroke-linejoin="round"
									d="m2.25 15.75 5.159-5.159a2.25 2.25 0 0 1 3.182 0l5.159 5.159m-1.5-1.5 1.409-1.409a2.25 2.25 0 0 1 3.182 0l2.909 2.909m-18 3.75h16.5a1.5 1.5 0 0 0 1.5-1.5V6a1.5 1.5 0 0 0-1.5-1.5H3.75A1.5 1.5 0 0 0 2.25 6v12a1.5 1.5 0 0 0 1.5 1.5Zm10.5-11.25h.008v.008h-.008V8.25Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z"
								/>
							</svg>
							<p class="text-xs text-gray-700">20 photos</p>
						</span>
        `}
				>
					{@render imageAttachment('https://picsum.photos/200')}
					{@render imageAttachment('https://picsum.photos/200')}
					{@render imageAttachment('https://picsum.photos/200')}
					{@render imageAttachment('https://picsum.photos/200')}
					{@render imageAttachment('https://picsum.photos/200')}
				</CustomDropdown>
				<CustomDropdown
					heading={` 
						<span class="flex gap-1 items-center">
							<svg
								xmlns="http://www.w3.org/2000/svg"
								fill="none"
								viewBox="0 0 24 24"
								stroke-width="1"
								stroke="currentColor"
								class="size-4"
							>
								<path
									stroke-linecap="round"
									stroke-linejoin="round"
									d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z"
								/>
							</svg>
							<p class="text-xs text-gray-700">10 files</p>
						</span>
        `}
				>
					{@render imageAttachment('https://picsum.photos/200')}
					{@render imageAttachment('https://picsum.photos/200')}
					{@render imageAttachment('https://picsum.photos/200')}
					{@render imageAttachment('https://picsum.photos/200')}
					{@render imageAttachment('https://picsum.photos/200')}
				</CustomDropdown>
				<div class="flex flex-col items-start w-full p-2 mt-2">
					<p>Members</p>
					<div class="flex flex-col items-start w-full overflow-scroll">
						{@render memberCard({
							image: 'https://picsum.photos/200',
							name: 'Ayo Olu',
							admin: true,
							online: true
						})}
						{@render memberCard({
							image: 'https://picsum.photos/200',
							name: 'Ayo Olu',
							admin: true,
							online: false
						})}
						{@render memberCard({
							image: 'https://picsum.photos/200',
							name: 'Ayo Olu',
							admin: false,
							online: false
						})}
						{@render memberCard({
							image: 'https://picsum.photos/200',
							name: 'Ayo Olu',
							admin: false,
							online: false
						})}
					</div>
				</div>
			</div>
		</div>
	{/if}
</div>

{#snippet imageAttachment(src: string)}
	<figure class="flex-shrink-0 h-16 w-24">
		<img {src} alt="" class="rounded-lg object-cover w-full h-full" />
	</figure>
{/snippet}

{#snippet memberCard({
	image,
	name,
	admin,
	online
}: {
	image: string;
	name: string;
	admin: boolean;
	online: boolean;
})}
	<div class="flex gap-2 items-center pb-2 w-full">
		<figure class="relative flex-shrink-0 h-9 w-9">
			<img src={image} alt="" class="rounded-full" />
			<div
				class="{online
					? 'bg-green-400'
					: 'bg-gray-400'} h-2 w-2 absolute rounded-full right-0 bottom-0 border-1 border-white"
			></div>
		</figure>
		<p class="text-xs">{name}</p>
		{#if admin}
			<p class="flex-1 text-end text-[9px]">Admin</p>
		{/if}
	</div>
{/snippet}
