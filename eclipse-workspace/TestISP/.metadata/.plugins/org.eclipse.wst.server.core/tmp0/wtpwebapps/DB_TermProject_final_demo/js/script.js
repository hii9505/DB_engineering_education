let lists = document.querySelectorAll("nav li a");

for (let list of lists) {
	list.addEventListener("click", (event) => {
		let mains = document.querySelectorAll("main");
		for (let main of mains) {
			main.setAttribute("hidden", "hidden");
		}
		
		document.querySelector(event.target.hash).removeAttribute("hidden");
	});
}