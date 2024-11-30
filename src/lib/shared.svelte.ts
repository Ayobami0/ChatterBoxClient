const currentRoom = $state({
  value: ''
});

const currentPage = $state(
  {value: 'messages'}
);

export { currentRoom, currentPage };
