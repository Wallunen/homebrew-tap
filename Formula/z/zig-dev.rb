class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0904ce8b92aaaf211e49327c885704a944b7fe9947a7156282c2531ec14bcbf7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "78e48c8d5fab82e0e7d528c29ef0386f736540b2932d8539b5530a33bbb7c220" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "653417acce7071bb9e7ab698c4b905264bdc65fa677150216d9764cb27f65dd3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1052+d6f997259.tar.xz"
  version "0.14.0-dev.1052+d6f997259"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
