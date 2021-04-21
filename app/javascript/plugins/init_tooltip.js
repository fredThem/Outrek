// var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
// var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
//   return new bootstrap.Tooltip(tooltipTriggerEl)
// })

const tooltipList = () => {
  $(function () {
    $('[data-bs-toggle="tooltip"]').tooltip()
  })
}

// export { tooltipList };

export { tooltipList };