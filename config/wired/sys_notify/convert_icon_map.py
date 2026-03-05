from sys import argv
from argparse import ArgumentParser
from os.path import isdir, isfile
from re import fullmatch
from bs4 import BeautifulSoup, Comment, Tag
from cairosvg import svg2png

def main():
    parser = ArgumentParser(
            prog=argv[0],
            description="Convert an html-file with comment-labled svgs to pngs"
        )
    parser.add_argument('-i', '--input', help="Input-html-file")
    parser.add_argument('-s', '--size', help='Set png-size, in XxY')
    parser.add_argument('-c', '--color', help='Color value, everthing that would be valid in html')
    parser.add_argument('-o', '--output', help='Output dir for pngs')

    args = parser.parse_args()


    if not args.input or not isfile(args.input):
        print('Invalid input-file :(')
        exit(1)

    if not args.output or not isdir(args.output):
        print('Invalid output-dir :(')
        exit(1)

    size_group = fullmatch(r"(\d*)x(\d*)", args.size if args.size else '')

    if not size_group:
        print('Invalid size :(')
        exit(1)

    x = int(size_group.groups()[0])
    y = int(size_group.groups()[1])

    if not args.color:
        print('Please provide a color')
        exit(1)

    with open(args.input, 'r') as input:
        html = BeautifulSoup('\n'.join(input.readlines()), 'html.parser')

    file_map = {}
    current = ''

    body = html.find_all('body')
    if len(body) != 1:
        print('Invalid html!')
        exit(0)
    body = body[0]

    for tag in body:
        if isinstance(tag, Comment):
            current = str(tag).lower().replace('-', '_').strip() + ".png"
        elif isinstance(tag, Tag) and tag.name == 'svg':
            _, _, v_x, v_y = [int(i) for i in  str(tag['viewbox']).split(' ')]

            # end_x = int(str(tag['width']).replace('px', ''))
            # end_y = int(str(tag['height']).replace('px', ''))
            #
            # asp = v_x / v_y

            tag['width'] = f'{x}px'
            tag['height'] = f'{y}px'
            # tag['viewBox'] = f'0 0 {end_x * asp} {end_y * asp}'
            tag['fill'] = args.color
            tag['stroke'] = args.color
            #
            tag['viewBox'] = f'0 0 {v_x} {v_y}'
            tag['preserveAspectRatio'] = 'xMidYMid meet'

            file_map.update({current: str(tag)})

    for filename, svg_content in file_map.items():
        path = f'{args.output}/{filename}'
        svg2png(bytestring=svg_content, write_to=path, output_width=x, output_height=y)

        print(f'Exported {path}...')

    print('Finished!')
if __name__ == '__main__':
    main()
