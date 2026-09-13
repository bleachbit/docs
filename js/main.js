(() => {
    'use strict';

    // The Clipboard API is only available in secure contexts
    if (!navigator.clipboard) {
        return;
    }

    // Console blocks: copy the command after each prompt (.gp), skip the output (.go)
    function getCommands(code) {
        return [...code.querySelectorAll('.gp')].map(prompt => {
            const range = document.createRange();
            range.setStartAfter(prompt);
            range.setEnd(code, code.childNodes.length);
            return range.toString().split('\n', 1)[0].trim();
        }).join('\n');
    }

    function getText(code) {
        if (code.querySelector('.gp')) {
            return getCommands(code);
        }

        // Rouge always ends the block with a newline
        return code.textContent.replace(/\n+$/, '');
    }

    function addCopyButton(block, code) {
        const button = document.createElement('button');
        button.type = 'button';
        button.className = 'copy-button';
        button.textContent = 'Copy';
        button.setAttribute('aria-label', 'Copy code to clipboard');

        let timeout;
        button.addEventListener('click', async () => {
            try {
                await navigator.clipboard.writeText(getText(code));
                button.textContent = 'Copied!';
            } catch (error) {
                console.error('Failed to copy:', error);
                button.textContent = 'Failed';
            }

            clearTimeout(timeout);
            timeout = setTimeout(() => {
                button.textContent = 'Copy';
            }, 2000);
        });

        block.append(button);
    }

    for (const block of document.querySelectorAll('div.highlighter-rouge')) {
        const code = block.querySelector('code');
        if (code) {
            addCopyButton(block, code);
        }
    }
})();
