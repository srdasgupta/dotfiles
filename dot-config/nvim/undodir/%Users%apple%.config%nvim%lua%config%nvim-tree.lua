Vim�UnDo� �^�r�����Ya��� i���G�2�Bk6   �     require("nvim-tree").setup {            #       #   #   #    b�&\    _�                             ����                                                                                                                                                                                                                                                                                                                                                             b�H    �   �                   �   �            �   �                  timeout =�   �            �   Y                        unmerg�   Z            �   6               �   7            �                 >  --disable_netrw = false, -> already disabled on `/core/optio�               �                   �               5��                       >                   �      �       >           !      �                     �    6              #      �                    �    Y              *      	                    �    �              #      *                     �    �                    *              }       5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                                             b��    �   !   #   �          width = 32,5��    !                    .                    5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                                             b��    �   !   #   �          width = 25,5��    !                    /                    5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                                             b�!�    �   !   #   �          width = 20,5��    !                    .                    5�_�                    &       ����                                                                                                                                                                                                                                                                                                                                                             b�"�     �   &   (   �    �   &   '   �    5��    &                      �              )       5�_�                    &       ����                                                                                                                                                                                                                                                                                                                                                             b�"�     �   %   '   �      (    preserve_window_proportions = false,5��    %                     x                     5�_�                    '   '    ����                                                                                                                                                                                                                                                                                                                                                             b�#    �   &   (   �      (    preserve_window_proportions = false,5��    &   "                 �                    �    &   "                 �                    5�_�      	              &       ����                                                                                                                                                                                                                                                                                                                                                             b�#"     �   %   '   �      +    -- preserve_window_proportions = false,5��    %                     x                     5�_�      
           	   &       ����                                                                                                                                                                                                                                                                                                                                                             b�#"     �   %   '   �      *    - preserve_window_proportions = false,5��    %                     x                     5�_�   	              
   &       ����                                                                                                                                                                                                                                                                                                                                                             b�#"     �   %   '   �      )     preserve_window_proportions = false,5��    %                     x                     5�_�   
                 '       ����                                                                                                                                                                                                                                                                                                                                                             b�#$    �   &   '          '    preserve_window_proportions = true,5��    &                      �      (               5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                                             b�#;     �   !   #   �          width = 30,5��    !                    0                    5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                                             b�#=    �   !   #   �          width = 3025��    !                     /                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�$T     �         �      nvim_tree.setup {5��                          h                     �                         i                     �                         h                    �                         i                     �                         h                    �                         i                     �                         h                    �                         i                     �                         h                    �                         i                     �                      	   h             	       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�$\     �         �      require("nvim_tree.setup {5��                         z                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�$f     �         �      require("nvim_tree").setup {5��                          h                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�$g     �         �       5��                          h                     �                         h                    �                         h                    �                         h                    �                         h                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�$k     �         �      function M.5��                         s                     �                        s                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$|     �              �   require("nvim_tree").setup {     auto_reload_on_write = true,   "  create_in_closed_folder = false,   E  --disable_netrw = false, -> already disabled on `/core/options.lua`     hijack_netrw = true,   -  hijack_unnamed_buffer_when_opening = false,   !  ignore_buffer_on_setup = false,     open_on_setup = true,     open_on_setup_file = false,     open_on_tab = true,     sort_by = "name",     reload_on_bufenter = false,     respect_buf_cwd = false,     update_cwd = true,   
  view = {       width = 32       height = 30,       hide_root_folder = false,       side = "left",   (    preserve_window_proportions = false,       number = false,       relativenumber = false,       signcolumn = "yes",       mappings = {         custom_only = false,         list = {            -- user mappings go here         },       },     },     renderer = {       add_trailing = false,       group_empty = false,       highlight_git = false,   $    highlight_opened_files = "none",        root_folder_modifier = ":~",       indent_markers = {         enable = false,         icons = {           corner = "└ ",           edge = "│ ",           none = "  ",         },       },       icons = {         webdev_colors = true,         git_placement = "before",         padding = " ",         symlink_arrow = " ➛ ",         show = {           file = true,           folder = true,           folder_arrow = true,           git = true,         },         glyphs = {           default = "",           symlink = "",           folder = {             arrow_closed = "",             arrow_open = "",             default = "",             open = "",             empty = "",             empty_open = "",             symlink = "",             symlink_open = "",   
        },           git = {             unstaged = "✗",             staged = "✓",             unmerged = "",             renamed = "➜",             untracked = "★",             deleted = "",             ignored = "◌",   
        },         },       },   K    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },     },     hijack_directories = {       enable = true,       auto_open = true,     },     update_focused_file = {       enable = true,       update_cwd = true,       ignore_list = {},     },     ignore_ft_on_setup = {},     system_open = {       cmd = "",       args = {},     },     diagnostics = {       enable = false,       show_on_dirs = false,       icons = {         hint = "",         info = "",         warning = "",         error = "",       },     },     filters = {       dotfiles = false,       custom = {},       exclude = {},     },   	  git = {       enable = true,       ignore = true,       timeout = 400,     },     actions = {        use_system_clipboard = true,       change_dir = {         enable = true,         global = false,   !      restrict_above_cwd = false,       },       open_file = {         quit_on_open = false,         resize_window = true,         window_picker = {           enable = true,   7        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",           exclude = {   W          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },   5          buftype = { "nofile", "terminal", "help" },   
        },         },       },     },     trash = {       cmd = "trash",       require_confirm = true,     },     live_filter = {       prefix = "[FILTER]: ",       always_show_folders = true,     },   	  log = {       enable = false,       truncate = false,       types = {         all = false,         config = false,         copy_paste = false,         diagnostics = false,         git = false,         profile = false,       },     },   }5��                          {                     �                         �                    �                         �                    �                         �                    �                         (                    �                         A                    �                         q                    �                         �                    �                         �                    �                         �                    �                         �                    �                         �                    �                                             �                          :                    �    !                     Q                    �    "                     ^                    �    #                     o                    �    $                     �                    �    %                     �                    �    &                     �                    �    '                     �                    �    (                     �                    �    )                                         �    *                     0                    �    +                     C                    �    ,                     `                    �    -                  
   q             
       �    .                     �                    �    /                     �                    �    0                     �                    �    1                     �                    �    2                     �                    �    3                     �                    �    4                     �                    �    5                                         �    6                     ;                    �    7                     ^                    �    8                     w                    �    9                     �                    �    :                  
   �             
       �    ;                  
   �             
       �    <                  
   �             
       �    =                     �                    �    >                     �                    �    ?                                          �    @                                         �    A                     .                    �    B                     P                    �    C                     g                    �    D                     �                    �    E                  
   �             
       �    F                  
   �             
       �    G                  
   �             
       �    H                  
   �             
       �    I                     �                    �    J                     	                    �    K                  
                
       �    L                  
   7             
       �    M                  
   R             
       �    N           
          g      
              �    O           
          �      
              �    P           
          �      
              �    Q           
          �      
              �    R           
          �      
              �    S           
          �      
              �    T           
          	      
              �    U           
          8	      
              �    V                  
   Z	             
       �    W                  
   g	             
       �    X           
          y	      
              �    Y           
          �	      
              �    Z           
          �	      
              �    [           
          �	      
              �    \           
          �	      
              �    ]           
          
      
              �    ^           
          *
      
              �    _                  
   G
             
       �    `                     T
                    �    a                     _
                    �    b                     h
                    �    c                     �
                    �    d                     �
                    �    e                     �
                    �    f                     �
                    �    g                                         �    h                                         �    i                     (                    �    j                     =                    �    k                     V                    �    l                     n                    �    m                     u                    �    n                     �                    �    o                     �                    �    p                     �                    �    q                     �                    �    r                     �                    �    s                     �                    �    t                     �                    �    u                                         �    v                     $                    �    w                     :                    �    x                     P                    �    y                     i                    �    z                     �                    �    {                     �                    �    |                     �                    �    }                     �                    �    ~                     �                    �                         �                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                                         �    �                                         �    �                     1                    �    �                     8                    �    �                     H                    �    �                     k                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                                         �    �                     ,                    �    �                  
   F             
       �    �                  
   _             
       �    �                  
   �             
       �    �           
          �      
              �    �           
          	      
              �    �                  
   A             
       �    �                     N                    �    �                     Y                    �    �                     b                    �    �                     i                    �    �                     w                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                                         �    �                                         �    �                                         �    �                     -                    �    �                     E                    �    �                     U                    �    �                     j                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                     �                    �    �                      �                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �   �                }5��    �                    �                     �    �                     �                     �    �                     �                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �   
      �      8local status_ok, nvim_tree = pcall(require, 'nvim-tree')5��    
                      T                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �         �      if not status_ok then5��                          �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �         �        return5��                          �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �         �      end5��                          �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �   
      �      9"local status_ok, nvim_tree = pcall(require, 'nvim-tree')5��    
                     T                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �         �      "if not status_ok then5��                         �                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �         �      
""  return5��                         �                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �         �      "end5��                         �                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �         �      function M.setup()5��                          p                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�     �         �       5��                          p                     5�_�                             ����                                                                                                                                                                                                                                                                                                                                       �           v        b�$�   	 �         �       5��                          p                     �                        v                    5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                             b�$�   
 �         �        require("nvim_tree").setup {5��                        �                    5�_�       "           !   �       ����                                                                                                                                                                                                                                                                                                                                                             b�%�    �   �              end5��    �                                          �    �                                           �    �                                           �    �                                         �    �                                        �    �                                         �    �                                         �    �                                         �    �                                         �    �                                        5�_�   !   #           "          ����                                                                                                                                                                                                                                                                                                                                                             b�&W     �         �        require("nvim-tree").setup {5��       	                 �                    5�_�   "               #          ����                                                                                                                                                                                                                                                                                                                                                             b�&[    �         �        require'nvim-tree").setup {5��                        �                    5��