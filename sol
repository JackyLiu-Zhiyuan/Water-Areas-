https://www.algoexpert.io/questions/water-area
Water Areas:

from copy import deepcopy

def waterArea(heights):
    if len(heights) < 3:
        return 0
    leftMax = [0 for i in range(len(heights))]
    rightMax = [0 for i in range(len(heights))]

    left_temp = heights[0]
    for i in range(1,len(heights)):
        left_temp = max(left_temp,heights[i-1])
        leftMax[i] = left_temp

    heights_copy = deepcopy(heights)

    heights.reverse()

    right_temp = heights[0]
    for i in range(1,len(heights)):
        right_temp = max(right_temp,heights[i-1])
        rightMax[i] = right_temp

    rightMax.reverse()

    areas = [0 for i in range(len(heights))]
    for i in range(len(heights)):
        min_height = min(leftMax[i],rightMax[i])
        # print(min_height)
        if heights_copy[i] < min_height:
            areas[i] = (min_height-heights_copy[i])

    return sum(areas)

