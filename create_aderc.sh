cd "$(dirname "$0")"

rm .aderc

echo -e export ADE_DOCKER_RUN_ARGS=\"$'\n'\
$'\t'--cap-add=SYS_PTRACE$'\n'\
$'\t'-v /home/$USER/.ssh:/$USER/.ssh:ro\"$'\n'\
export ADE_IMAGES=\"$'\n'\
$'\t'brtcyphal/cyphal_tools:cyphal$'\n'\
$'\t'brtcyphal/cyphal_vscode:latest$'\n'\
\" >.aderc