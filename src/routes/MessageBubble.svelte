<script>

	import { fly } from "svelte/transition";

</script>
<!--TODO: Add functionality for when sender is current session-->
<div class="flex items-end gap-2 max-w-[90%]" transition:fly={{duration:200, x:-100}}>
	<figure class="flex-shrink-0 w-11 h-11">
		<img src="https://picsum.photos/200" alt="" class="rounded-full"/>
	</figure>
	<div class="rounded-lg rounded-bl-none flex flex-col p-3 py-1 bg-blue-100/50">
		<p class="text-sm text-blue-950">Name</p>
		<p class="text-sm">
			Some message from name. This is a long message and it contains a lot of text
		</p>
		<div class="flex gap-3 justify-end text-xs text-gray-700/50">
			<span class="flex items-center gap-1">
				<svg
					xmlns="http://www.w3.org/2000/svg"
					fill="none"
					viewBox="0 0 24 24"
					stroke-width="1"
					class="size-3 stroke-gray-700"
				>
					<path
						stroke-linecap="round"
						stroke-linejoin="round"
						d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z"
					/>
					<path
						stroke-linecap="round"
						stroke-linejoin="round"
						d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"
					/>
				</svg>
				<p>10</p>
      </span
			>
			<p>09:24</p>
		</div>
	</div>
</div>
