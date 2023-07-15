import subprocess

subprocess.check_call(["pip", "install", "webuiapi", "--break-system-packages"])

import webuiapi
import requests 

api = webuiapi.WebUIApi(host='127.0.0.1', port=7860)

result1 = api.txt2img(prompt="cute squirrel",
                    negative_prompt="ugly, out of frame",
                    seed=0,
                    save_images=True,
                    cfg_scale=7,
                    )

# Available Axis options (Different for txt2img and img2img!)
XYZPlotAvailableTxt2ImgScripts = [
    "Nothing",
    "Seed",
    "Var. seed",
    "Var. strength",
    "Steps",
    "Hires steps",
    "CFG Scale",
    "Prompt S/R",
    "Prompt order",
    "Sampler",
    "Checkpoint name",
    "Sigma Churn",
    "Sigma min",
    "Sigma max",
    "Sigma noise",
    "Eta",
    "Clip skip",
    "Denoising",
    "Hires upscaler",
    "VAE",
    "Styles",
]

XYZPlotAvailableImg2ImgScripts = [
    "Nothing",
    "Seed",
    "Var. seed",
    "Var. strength",
    "Steps",
    "CFG Scale",
    "Image CFG Scale",
    "Prompt S/R",
    "Prompt order",
    "Sampler",
    "Checkpoint name",
    "Sigma Churn",
    "Sigma min",
    "Sigma max",
    "Sigma noise",
    "Eta",
    "Clip skip",
    "Denoising",
    "Cond. Image Mask Weight",
    "VAE",
    "Styles",
]

# Example call
XAxisType = "Steps"
XAxisValues = "20,30" 
YAxisType = "Sampler"
YAxisValues = "Euler a, LMS"
ZAxisType = "Nothing"
ZAxisValues = ""
drawLegend = "True"
includeLoneImages = "False"
includeSubGrids = "False"
noFixedSeeds = "False"
marginSize = 0


# x_type, x_values, y_type, y_values, z_type, z_values, draw_legend, include_lone_images, include_sub_grids, no_fixed_seeds, margin_size

result = api.txt2img(
                    prompt="cute squirrel",
                    negative_prompt="ugly, out of frame",
                    seed=0,
                    save_images=True,
                    cfg_scale=7,
                    script_name="X/Y/Z Plot",
                    script_args=[
                        XYZPlotAvailableTxt2ImgScripts.index(XAxisType),
                        XAxisValues,
                        XYZPlotAvailableTxt2ImgScripts.index(YAxisType),
                        YAxisValues,
                        XYZPlotAvailableTxt2ImgScripts.index(ZAxisType),
                        ZAxisValues,
                        drawLegend,
                        includeLoneImages,
                        includeSubGrids,
                        noFixedSeeds,
                        marginSize,                        ]
                    )
