class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "75ae37fdb4a2789191d7680b64f05487aa3da8936b13c336e2793fc12e5a9104" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cbeec7bed4b494165de1048674e371540740b0efa0fdbb703d7834be6c38e0d7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d3f7f44a0685ab7e3d848705a1fc03c338660fdfc9173ccea1cc9a92a6bea17f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3632+7fb5a0b18.tar.xz"
  version "0.12.0-dev.3632+7fb5a0b18"
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
