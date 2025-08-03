#!/bin/bash

# Script to convert images to WebP format
# Usage: ./convert_to_webp.sh

echo "Starting WebP conversion..."

# Find all PNG, JPG, JPEG files and convert them to WebP
find uploads -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | while read -r file; do
    # Get file without extension
    filename="${file%.*}"
    webp_file="${filename}.webp"
    
    # Skip if WebP already exists
    if [ -f "$webp_file" ]; then
        echo "Skipping $file - WebP already exists"
        continue
    fi
    
    # Convert to WebP with quality 85
    if cwebp -q 85 "$file" -o "$webp_file"; then
        echo "Converted: $file -> $webp_file"
        
        # Get file sizes for comparison
        original_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file")
        webp_size=$(stat -f%z "$webp_file" 2>/dev/null || stat -c%s "$webp_file")
        
        # Calculate compression ratio
        if [ "$original_size" -gt 0 ]; then
            ratio=$((100 - (webp_size * 100 / original_size)))
            echo "  Size reduction: ${ratio}%"
        fi
    else
        echo "Failed to convert: $file"
    fi
done

echo "WebP conversion completed!"