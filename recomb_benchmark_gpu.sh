#!/bin/bash
#SBATCH --job-name=recomb_bg
#SBATCH -p preempt
#SBATCH -n 2
#SBATCH --gres=gpu:a100:1 
#SBATCH --mem=8g
#SBATCH --time=0-4:00:00

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/cluster/tufts/slonimlab/hzhu07/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/cluster/tufts/slonimlab/hzhu07/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/cluster/tufts/slonimlab/hzhu07/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/cluster/tufts/slonimlab/hzhu07/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

cd /cluster/tufts/slonimlab/hzhu07/grn-diffusion
conda activate grn
python recomb_benchmark_all.py "$1"