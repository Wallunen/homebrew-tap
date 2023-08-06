class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cb8728f2716a9154eed721ae67ad194a0c8a9cce1d8b8873b111455445028c46" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "31894e6f5a253598afe10818733ebadce652a8685aa1db62d68ec4202d679783" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0c00c86c6097fc4bd16647b2f568128f5a6f6dbda9e73508ba54e7b84762f3ec" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.7+90fde14c5.tar.xz"
  version "0.12.0-dev.7+90fde14c5"
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
