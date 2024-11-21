class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fc77de265737737925e6c40d4339996506582565621bea0e834e552cd98a5e0d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "edabf50fcfe506e81132b961812927ddb6325362b47c6da357f1f31a3fcca6c4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a777460eccebc0ab4396061f5ae66b472302881395a96a02fa103b75f9ddf615" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2271+f845fa04a.tar.xz"
  version "0.14.0-dev.2271+f845fa04a"
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
