# https://www.youtube.com/watch?v=2Fp1N6dof0Y

from subprocess import run

cmd = 'kubectl get pods -oyaml'
with open('output.yaml', 'w') as f:
	pod_spec = run(cmd,
		text=True,
		shell=True,
		stdout=f,
		# capture_output=True,
	)