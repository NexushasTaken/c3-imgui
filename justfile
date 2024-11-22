generate-c3-wrapper delete:
  [[ "{{delete}}" == "yes" ]] && rm -rf enums.c3 structs.c3 templated_structs.c3 typedefs.c3 wrappers.c3 imgui.c3i || exit 0
  c3c run generator
