// API reference cards.
// Two-column card (.api-card): a list of methods on the left, details of the selected method on the right.
// One-column card (.api-acc): one row per method signature; clicking a row expands its description and example.
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".method-picker").forEach(function (card) {
        const picker = card.querySelector("select");
        const entries = card.querySelectorAll(".method-entry");
        function showMethod() {
            entries.forEach(function (entry) {
                entry.hidden = entry.id !== picker.value;
            });
        }
        picker.addEventListener("change", showMethod);
        showMethod();
        picker.hidden = false;
    });

    document.querySelectorAll(".api-card").forEach(function (card) {
        var items = Array.prototype.slice.call(card.querySelectorAll(".api-item"));
        var panes = card.querySelectorAll(".api-pane");
        var show = function (index, focus) {
            items.forEach(function (item, i) {
                item.classList.toggle("active", i === index);
                item.setAttribute("aria-selected", i === index ? "true" : "false");
                item.tabIndex = i === index ? 0 : -1;
            });
            panes.forEach(function (pane, i) { pane.classList.toggle("active", i === index); });
            if (focus) items[index].focus();
        };
        items.forEach(function (item, i) {
            item.addEventListener("click", function () { show(i, false); });
            item.addEventListener("keydown", function (e) {
                if (e.key === "ArrowDown" || e.key === "ArrowRight") { e.preventDefault(); show((i + 1) % items.length, true); }
                if (e.key === "ArrowUp" || e.key === "ArrowLeft") { e.preventDefault(); show((i - 1 + items.length) % items.length, true); }
            });
        });
        show(0, false);
    });

    document.querySelectorAll(".api-acc-head").forEach(function (head) {
        head.addEventListener("click", function () {
            var row = head.parentElement;
            var open = !row.classList.contains("open");
            row.classList.toggle("open", open);
            head.setAttribute("aria-expanded", open ? "true" : "false");
            row.querySelector(".api-acc-body").hidden = !open;
        });
    });
});
