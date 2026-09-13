// Add copy buttons to code blocks
var codeBlocks = document.querySelectorAll('div.highlighter-rouge');

// For console blocks, copy only the commands, not the prompt or output.
// Rouge marks the prompt with span.gp and the output with span.go.
function extractCommands(codeEl) {
    var lines = [];
    var line = { hasPrompt: false, text: '' };
    function walk(node) {
        if (node.nodeType === Node.TEXT_NODE) {
            var parts = node.textContent.split('\n');
            parts.forEach(function(part, i) {
                if (i > 0) {
                    lines.push(line);
                    line = { hasPrompt: false, text: '' };
                }
                line.text += part;
            });
        } else if (node.nodeType === Node.ELEMENT_NODE) {
            if (node.classList.contains('gp')) {
                line.hasPrompt = true;
                return; // exclude the prompt itself from the copied text
            }
            node.childNodes.forEach(walk);
        }
    }
    Array.prototype.forEach.call(codeEl.childNodes, walk);
    lines.push(line);
    return lines.filter(function(l) { return l.hasPrompt; })
                .map(function(l) { return l.text.trim(); })
                .join('\n');
}

codeBlocks.forEach(function(codeBlock) {
    var button = document.createElement('button');
    button.className = 'copy-button';
    button.type = 'button';
    button.ariaLabel = 'Copy code to clipboard';
    button.textContent = 'Copy';

    button.addEventListener('click', function() {
        var codeEl = codeBlock.querySelector('code');
        var isConsole = codeEl.querySelectorAll('span.gp').length > 0;
        // Rouge always ends the block with a newline
        var code = isConsole
            ? extractCommands(codeEl)
            : codeEl.textContent.replace(/\n+$/, '');
        navigator.clipboard.writeText(code).then(function() {
            button.textContent = 'Copied!';
            setTimeout(function() {
                button.textContent = 'Copy';
            }, 2000);
        }).catch(function(err) {
            console.error('Failed to copy: ', err);
        });
    });

    codeBlock.style.position = 'relative';
    codeBlock.appendChild(button);
});
