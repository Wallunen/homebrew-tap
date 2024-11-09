class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ef13ade8a6c6e6ed5b39b5be5bb56eead38a7ea305120a2333587bb3f54de2bf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f9916d790cc7b56ed4b725febc834c7f7d5c1f6109e51a02d78e945089fc49c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d7c404daeef1504d0617a85887744a922e0451b7a0c7046cfad61e366b9f0eeb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2198+e5f5229fd.tar.xz"
  version "0.14.0-dev.2198+e5f5229fd"
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
