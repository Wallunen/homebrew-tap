class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "96fa4774b01b316b1002060456eff5b2d5ea5b0b225c7dd59302691197a66be5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "39a6edd41c7c37fd93544b823582a0f28bda0e0bd3af4570387a96bc0a3b8d75" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "79a57f4fb9db6151f281c8d8f3d553ea3a52e4c8dcaf61661e7e89e591567515" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3951+874d2dd9f.tar.xz"
  version "0.11.0-dev.3951+874d2dd9f"
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
